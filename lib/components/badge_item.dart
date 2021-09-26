import 'package:badges/badges.dart';
import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Badge badgeItem({required int counter}) {
  return Badge(
    badgeContent: Text(
      counter.toString(),
      style: const TextStyle(color: Colors.white),
    ),
    child: SvgPicture.asset(
      "assets/icons/cart.svg",
      // By default our  icon color is white
      color: kTextColor,
    ),
  );
}
