import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String customHintText;
  final IconData? icon;
  CustomTextField({super.key, required this.customHintText, this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: TextStyle(fontSize: 15),
        // controller: _emailController,
        decoration: InputDecoration(
          suffixIcon: Icon(widget.icon, color: Colors.grey[600]),
          contentPadding: EdgeInsets.all(30),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: widget.customHintText,
          fillColor: Color(0xFF262A34),
          filled: true,
          hintStyle: TextStyle(
            color: Color(0xFF56585F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
