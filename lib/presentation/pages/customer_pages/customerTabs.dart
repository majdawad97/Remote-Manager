import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:remote_manager/presentation/pages/customer_pages/customer_cart.dart';
import 'package:remote_manager/presentation/pages/customer_pages/customer_home_page.dart';
import 'package:remote_manager/presentation/pages/customer_pages/customer_settings.dart';
import 'package:remote_manager/presentation/pages/customer_pages/customer_wallet.dart';

class CustomerTabs extends StatefulWidget {
  const CustomerTabs({super.key});

  @override
  State<CustomerTabs> createState() => _CustomerTabsState();
}

class _CustomerTabsState extends State<CustomerTabs> {
  int currentIndex = 0;
  List<Widget> pages = [
    const CustomerPage(),
    const CustomerWallet(),
    const CustomerCart(),
    const CustomerSettings(),
  ];

  List<GButton> bottomNavBarItems = [
    const GButton(
      icon: Icons.home_outlined,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.wallet,
      text: 'Wallet',
    ),
    const GButton(
      icon: Icons.shopping_cart_outlined,
      text: 'Cart',
    ),
    const GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          tabs: bottomNavBarItems,
          color: const Color(0xff39C7A5),
          activeColor: const Color(0xff39C7A5),
          gap: 8,
          onTabChange: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedIndex: currentIndex),
      body: pages[currentIndex],
    );
  }
}
