import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/header.dart';
import 'package:ecommerce/components/landing_body.dart';
import 'package:ecommerce/components/splash.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _calculateSquare(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: buildAppBar(context, title: true, backicon: false),
                body: const Body(),
                drawer: drawerItem(context));
          }
          return const SplashScreen();
        });
  }

  Future<int> _calculateSquare() async {
    await Future.delayed(const Duration(seconds: 5));
    return 10;
  }
}
