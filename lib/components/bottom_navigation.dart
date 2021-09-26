import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int _page = 0;

/// This is the private State class that goes with BottomNavigation.
class _BottomNavigationState extends State<BottomNavigation> {
  void _onItemTapped(int index) {
    // if (index == 1) {
    //   newScreen();
    // } else {
    homeScreen();
    // }
    setState(() {
      _page = index;
    });
  }

  // void newScreen() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const AddtoCartScreen(),
  //       ));
  // }

  void homeScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: (Colors.amber[800])!,
      index: _page,
      height: 50,
      items: <Widget>[
        const Icon(Icons.home),
        SvgPicture.asset(
          "assets/icons/cart.svg",
          // By default our  icon color is white
          color: kTextColor,
        ),
      ],

      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      onTap: _onItemTapped,
    );
  }
}
