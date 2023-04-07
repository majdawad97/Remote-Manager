import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remote_manager/data/models/user_role.dart';
import 'package:remote_manager/data/repositories/auth_repository.dart';
import 'package:remote_manager/presentation/pages/auth_pages/login_page.dart';
import 'package:remote_manager/presentation/widgets/custom_button.dart';
import 'package:remote_manager/presentation/widgets/text_field.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onClickedSignIn;
  const SignUpPage({
    Key? key,
    this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();

  UserRole userRole = UserRole.customer;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Create new account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please fill in the form to continue',
                style: TextStyle(color: Color(0xFF5A5C61), fontSize: 18),
              ),
              const SizedBox(
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
              DropdownButton<UserRole>(
                style: const TextStyle(
                  color: Color(0xFF5A5C61),
                ),
                dropdownColor: const Color(0xFF181A20),
                value: userRole,
                hint: const Text(
                  'Choose Role',
                  style: TextStyle(
                    color: Color(0xFF56585F),
                  ),
                ),
                items: UserRole.values.map((UserRole userRole) {
                  return DropdownMenuItem<UserRole>(
                    value: userRole,
                    child: Text(
                      userRole.toString(),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      userRole = value;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  buttonTapped: () async {
                    AuthRepository.signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                      number: _numberController.text,
                      userRole: userRole,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account Created Successfully'),
                      ),
                    );
                  },
                  color: 0xFF4C4CFF,
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: GestureDetector(
              //     onTap: () => AuthRepository.signUp(
              //       email: _emailController.text,
              //       password: _passwordController.text,
              //       name: _nameController.text,
              //       number: _numberController.text,
              //       userRole: userRole,
              //     ),
              //     child: Container(
              //       height: 80,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(25),
              //         color: const Color(0xFF4C4CFF),
              //       ),
              //       child: const Center(
              //         child: Text(
              //           'Sign Up',
              //           style: TextStyle(
              //               color: Colors.white, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    text: 'Have an account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                        text: 'Sign In',
                        style: const TextStyle(
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
