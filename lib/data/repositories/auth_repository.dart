import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:remote_manager/data/models/user_role.dart';

import '../models/user.dart';

class AuthRepository {
  static Future addUserDetails(UserModel user) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .set(user.toJson());
    }
  }

  static Future signUp(
      {required String email,
      required String password,
      required String name,
      required String number,
      required UserRole userRole}) async {
    {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // add user details
      await addUserDetails(
        UserModel(
          userFullName: name.trim(),
          userEmail: email.trim(),
          userNumber: int.parse(number),
          userRole: userRole,
        ),
      );
    }
  }

  static Future signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } catch (e) {
      print(e);
    }
  }
}
