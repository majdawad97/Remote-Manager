import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:remote_manager/data/models/user.dart';

class UserRepository {
  static Future<UserModel?> getUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(user!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception('Error fetching user');
    }
  }
}
