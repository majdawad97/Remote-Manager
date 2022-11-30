import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Manage your Company'),
          Lottie.asset('assets/animations/manager.json'),
          Text('Be on top of your work from home'),
        ],
      ),
    );
  }
}
