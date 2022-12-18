import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:remote_manager/screens/login_page.dart';
import 'package:remote_manager/util/text_field.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // add user details
      await addUserDetails(
        _nameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_numberController.text.trim()),
      );
    }
  }

  Future addUserDetails(String fullName, String email, int number) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fullName,
      'email': email,
      'number': number,
    });
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
                'Create new account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Please fill in the form to continue',
                style: TextStyle(color: Color(0xFF5A5C61), fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                controller: _nameController,
                customHintText: 'Full Name',
                obscureText: false,
              ),
              CustomTextField(
                controller: _emailController,
                customHintText: 'Email Address',
                obscureText: false,
              ),
              CustomTextField(
                controller: _numberController,
                customHintText: 'Phone Number',
                obscureText: false,
              ),
              CustomTextField(
                controller: _passwordController,
                customHintText: 'Password',
                icon: Icons.remove_red_eye,
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    child: Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF4C4CFF),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    text: 'Have an account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Sign In',
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
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 'Have an account? ',
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) {
    //                         return LoginPage();
    //                       },
    //                     ),
    //                   );
    //                 },
    //                 child: Text(
    //                   'Sign In',
    //                   style: TextStyle(
    //                     color: Color(0xFF4C4CFF),
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),