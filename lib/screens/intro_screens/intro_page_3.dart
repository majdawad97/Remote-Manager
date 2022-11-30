import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Browse from Home',
            style: GoogleFonts.sourceSansPro(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Lottie.asset('assets/animations/customer.json'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Take a look at the available items and their prices in your local store as a Customer',
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
