import 'package:flutter/material.dart';

import '../../data/models/user_role.dart';
import '../pages/customer_page.dart';
import '../pages/manager_page.dart';

void route(UserRole userRole, BuildContext context) {
  if (userRole == UserRole.manager) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ManagerPage(),
      ),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerPage(),
      ),
    );
  }
}
