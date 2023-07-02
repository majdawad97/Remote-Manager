import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth_pages/login_page.dart';

class CustomerSettings extends StatelessWidget {
  const CustomerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade200,
              width: double.infinity,
              height: 200,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Account information'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(endIndent: 20, indent: 20),
            const ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Address information'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(endIndent: 20, indent: 20),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment methods'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(endIndent: 20, indent: 20),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Appearance'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(endIndent: 20, indent: 20),
            const ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(endIndent: 20, indent: 20),
            const Spacer(),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color(0xff39C7A5),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            color: Color(0xff39C7A5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
