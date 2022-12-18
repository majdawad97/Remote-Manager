import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remote_manager/main.dart';
import 'package:remote_manager/screens/forgot_password_page.dart';
import 'package:remote_manager/screens/signup_page.dart';
import 'package:remote_manager/util/custom_button.dart';
import 'package:remote_manager/util/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
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

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
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
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                color: 0xFF4C4CFF,
              ),
              CustomButton(
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
                color: 0xFFFFFFFF,
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


//  Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Don\'t have an account? ',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SignUpPage();
//                           },
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Color(0xFF4C4CFF),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 ],
//               ),