import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/favorite_screen.dart';
import 'package:ecommerce/screens/landing_page.dart';
import 'package:ecommerce/screens/profile/profile.dart';
import 'package:flutter/material.dart';

Drawer drawerItem(context) {
  return Drawer(
    elevation: 0,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: lightGreenColor,
          ),
          child: Text(
            'CY Store',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Home'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.shopping_cart_outlined),
          title: Text('Orders'),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favorites'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoriteScreen(),
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('Address'),
        ),
        const ListTile(
          leading: Icon(Icons.payment),
          title: Text('Payment'),
        ),
        const ListTile(
          leading: Icon(Icons.logout_sharp),
          title: Text('LogOut'),
        ),
      ],
    ),
  );
}
