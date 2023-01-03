import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remote_manager/data/models/user_role.dart';
import 'package:remote_manager/data/repositories/auth_repository.dart';
import 'package:remote_manager/data/repositories/user_repository.dart';
import 'package:remote_manager/presentation/pages/customer_page.dart';
import 'package:remote_manager/presentation/pages/forgot_password_page.dart';
import 'package:remote_manager/presentation/pages/manager_page.dart';
import 'package:remote_manager/presentation/widgets/custom_button.dart';
import 'package:remote_manager/presentation/widgets/text_field.dart';

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

  void route(UserRole userRole) {
    if (userRole == UserRole.manager) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ManagerPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomerPage(),
        ),
      );
    }
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
                'Welcome Back!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please sign in to your account',
                style: TextStyle(color: Color(0xFF5A5C61), fontSize: 18),
              ),
              const SizedBox(
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF56585F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomButton(
                buttonTapped: () async {
                  try {
                    AuthRepository.signIn(
                        _emailController.text, _passwordController.text);
                    final user = await UserRepository.getUser();
                    if (user != null) {
                      route(user.userRole);
                    }
                  } catch (e) {}
                },
                color: 0xFF4C4CFF,
                child: const Center(
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          child: Image.asset('assets/images/google.png')),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    text: 'Don\'t have an account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up',
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
