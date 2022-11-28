import 'package:flutter/material.dart';
import 'package:kitchen_customer/pages/cart/cart_page.dart';
import 'package:kitchen_customer/pages/favorite/favorite_page.dart';
import 'package:kitchen_customer/pages/home/home_page.dart';
import 'package:kitchen_customer/pages/profile/profile_page.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({super.key});

  @override
  State<TabNavigation> createState() => TabNavigationState();
}

class BottomNavItem {
  String label;
  IconData icon;
  BottomNavItem(this.label, this.icon);
}

List<Widget> pages = [
  const HomePage(),
  const CartPage(),
  const FavoritePage(),
  const ProfilePage(),
];

List<BottomNavItem> items = [
  BottomNavItem("Home", Icons.home),
  BottomNavItem("Cart", Icons.shopping_basket),
  BottomNavItem("Favorite", Icons.favorite),
  BottomNavItem("Profile", Icons.person),
];

class TabNavigationState extends State<TabNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages.elementAt(currentIndex),
        extendBody: true,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), // adjust to your liking
              topRight: Radius.circular(20.0), // adjust to your liking
            ),
            color: Colors.white.withAlpha(200), // put the color here
          ),
          child: BottomNavigationBar(
            // backgroundColor: Colors.white.withOpacity(0.5),
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            // showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            selectedItemColor: Colors.green,
            items: items
                .map((e) =>
                    BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
                .toList(),
          ),
        ));
  }
}
