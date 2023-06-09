import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String customHintText;
  final IconData? icon;
  bool obscureText;
  final TextEditingController? controller;
  CustomTextField(
      {super.key,
      required this.customHintText,
      this.icon,
      required this.obscureText,
      this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                toggle();
              },
              child: Icon(widget.icon, color: Colors.grey[600])),
          contentPadding: const EdgeInsets.all(30),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: widget.customHintText,
          fillColor: const Color(0xFF262A34),
          filled: true,
          hintStyle: const TextStyle(
            color: Color(0xFF56585F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
