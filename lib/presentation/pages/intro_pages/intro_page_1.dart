import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Text(
            'Manage your Company',
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Lottie.asset('assets/animations/manager.json'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Stay on Top of your Business and Keep track of your teams as a Company Manager',
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
