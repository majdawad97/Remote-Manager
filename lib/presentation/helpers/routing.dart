import 'package:flutter/material.dart';
import 'package:remote_manager/presentation/pages/home_pages/admin_page.dart';

import '../../data/models/user_role.dart';
import '../pages/home_pages/customer_page.dart';
import '../pages/home_pages/manager_page.dart';

void routeUser(UserRole userRole, BuildContext context) {
  if (userRole == UserRole.manager) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ManagerPage(),
      ),
    );
  } else if (userRole == UserRole.admin) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminPage(),
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
