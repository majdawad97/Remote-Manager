import 'package:flutter/material.dart';
import 'package:remote_manager/data/repositories/user_repository.dart';
import 'package:remote_manager/presentation/helpers/routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final user = await UserRepository.getUser();
    if (user != null && mounted) {
      routeUser(user.userRole, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
