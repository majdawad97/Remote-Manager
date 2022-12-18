import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'signed in as',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            user.email!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
