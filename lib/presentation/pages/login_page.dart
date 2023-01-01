import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remote_manager/presentation/pages/customer_page.dart';
import 'package:remote_manager/presentation/pages/forgot_password_page.dart';
import 'package:remote_manager/presentation/pages/manager_page.dart';
import 'package:remote_manager/presentation/widgets/custom_button.dart';
import 'package:remote_manager/presentation/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onClickedSignUp;
  const LoginPage({
    Key? key,
    this.onClickedSignUp,
  }) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String?> getField() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      // print(user!.email);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(user!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['user_role'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  void route() async {
    final userRole = await getField();
    if (userRole == 'manager') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ManagerPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerPage(),
        ),
      );
    }
  }

  // Future getData() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   final users = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) => value)
  //       .then((value) => value.data());
  //   return FutureBuilder(
  //     future: users,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         final convertUserDataToMap =
  //             Map<String, dynamic>.from(snapshot.data as Map<dynamic, dynamic>);
  //         final List userDataList = convertUserDataToMap.values.toList();
  //         final userId = userDataList[0];
  //         final userLong = userDataList[1];
  //       }
  //     },
  //   );
  // }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      getField();
      route();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A20),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Welcome Back!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Please sign in to your account',
                style: TextStyle(color: Color(0xFF5A5C61), fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                controller: _emailController,
                obscureText: false,
                customHintText: 'Email Address',
              ),
              CustomTextField(
                controller: _passwordController,
                obscureText: true,
                customHintText: 'Password',
                icon: Icons.remove_red_eye,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF56585F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              CustomButton(
                buttonTapped: signIn,
                color: 0xFF4C4CFF,
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CustomButton(
                color: 0xFFFFFFFF,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          child: Image.asset('assets/images/google.png')),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    text: 'Don\'t have an account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF4C4CFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
