import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remote_manager/presentation/pages/auth_page.dart';
import 'package:remote_manager/presentation/pages/intro_pages/intro_page_1.dart';
import 'package:remote_manager/presentation/pages/intro_pages/intro_page_2.dart';
import 'package:remote_manager/presentation/pages/intro_pages/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc();

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
  }

  // controller to keep track of which page we are on
  final PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // page view
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        // dot indicator
        Container(
          alignment: const Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: const Text('Skip'),
              ),

              // dot indicator
              SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(),
                  onDotClicked: (index) {}),
              // next or done
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StreamBuilder<User?>(
                                stream:
                                    FirebaseAuth.instance.authStateChanges(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text('Something went wrong!'),
                                    );
                                  } else if (snapshot.hasData) {
                                    return const HomePage();
                                  } else {
                                    return const AuthPage();
                                  }
                                },
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Done'),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: const Text('Next'),
                    ),
            ],
          ),
        ),
      ],
    ));
  }
}
