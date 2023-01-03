import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var role = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _checkRole();
  }

  // void navigateNext(Widget route) {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => route));
  // }

  // void _checkRole() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   final DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get();

  //   setState(() {
  //     role = snap['user_role'];
  //   });

  //   if (role == 'basic') {
  //     navigateNext(const CustomerPage());
  //   } else if (role == 'manager') {
  //     navigateNext(const ManagerPage());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'signed in as',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            user.email!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
