import 'package:ecommerce/components/badge_item.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:ecommerce/screens/add_to_cart.details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redux/redux.dart';

AppBar buildAppBar(context, {bool? title, bool? backicon, Color? producColor}) {
  return AppBar(
    backgroundColor: producColor = producColor ?? Colors.white,
    elevation: 0,
    leading: (backicon ?? true)
        ? IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    centerTitle: true,
    title: Text(
      (title ?? true) ? "CY Store" : "",
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontWeight: FontWeight.bold),
    ),
    actions: [
      StoreConnector<AppState, List<CartItem>>(
          converter: (Store<AppState> store) => store.state.cartItem,
          builder: (context, List<CartItem> cartItem) {
            return IconButton(
              icon: badgeItem(counter: cartItem.length),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddtoCartScreen(),
                  )),
            );
          }),
      const SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
