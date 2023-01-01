import 'package:remote_manager/data/models/user_role.dart';

class UserModel {
  final String userFullName;
  final String userEmail;
  final int userNumber;
  final UserRole userRole;

  const UserModel(
      {required this.userFullName,
      required this.userEmail,
      required this.userNumber,
      required this.userRole});

  Map<String, dynamic> toJson() {
    return {
      'full_name': userFullName,
      'email': userEmail,
      'number': userNumber,
      'user_role': userRole.toJson(),
    };
  }
}