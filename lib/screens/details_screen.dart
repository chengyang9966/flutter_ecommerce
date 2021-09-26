import 'package:ecommerce/components/details_body.dart';
import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/header.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      resizeToAvoidBottomInset: false,
      backgroundColor: product.color,
      appBar: buildAppBar(context,
          backicon: true, producColor: product.color, title: false),
      body: BodyDetails(product: product),
      drawer: drawerItem(context),
    );
  }
}
