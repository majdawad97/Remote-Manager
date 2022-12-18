import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int color;
  final Widget child;
  final Function()? buttonTapped;
  const CustomButton(
      {super.key, required this.child, required this.color, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          child: child,
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(color),
          ),
        ),
      ),
    );
  }
}
