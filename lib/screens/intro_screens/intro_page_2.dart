import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lead your Team',
            style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Lottie.asset('assets/animations/retail_manager.json'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Keep each local store stocked and in place as a team leader',
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
