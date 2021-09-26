import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/header.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: drawerItem(context),
    );
  }
}
