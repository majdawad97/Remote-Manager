import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[200],
      child: Lottie.asset('assets/animations/retail_manager.json'),
    );
  }
}
