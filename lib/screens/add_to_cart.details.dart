// ignore_for_file: unnecessary_new

import 'package:ecommerce/components/add_to_cart_item.dart';
import 'package:ecommerce/components/details_add_to_cart.dart';
import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/toast_msg.dart';
import 'package:ecommerce/components/total_amount.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/reducers/actions/add_to_cart_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddtoCartScreen extends StatelessWidget {
  const AddtoCartScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void payment() {
      StoreProvider.of<AppState>(context).dispatch(RemoveAllAction());
      toastMessage('Paid Successfully');
    }

    return Scaffold(
        appBar: buildAppBar(context),
        drawer: drawerItem(context),
        body: new StoreConnector<AppState, List<CartItem>>(
          converter: (store) => store.state.cartItem,
          builder: (context, list) {
            if (list.isNotEmpty) {
              return checkoutCard(context, list, payment);
            }
            return ListView(
              padding: const EdgeInsets.only(
                  left: kDefaultPaddin / 2, right: kDefaultPaddin / 2),
              children: <Widget>[
                Container(
                    height: 500,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text(
                      'No item in cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ))
              ],
            );
          },
        ));

    //  ListView(
    //   children: _getListElements(cartItems),
    // ));
  }

  ListView checkoutCard(
      BuildContext context, List<CartItem> list, VoidCallback payment) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              ..._getListElements(context, list),
              Container(
                margin: const EdgeInsets.only(top: kDefaultPaddin),
                padding: const EdgeInsets.only(
                  left: kDefaultPaddin,
                  right: kDefaultPaddin,
                ),
                decoration: BoxDecoration(
                  color: (Colors.grey[200])!,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    TotalAmount(items: list),
                    AddToCart(
                        color: Colors.blue,
                        title: 'Proceed to Checkout',
                        onPress: () => payment())
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          // color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "My Cart",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _getListElements(
      BuildContext context, List<CartItem> cartItems) {
    Size size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    for (var n in cartItems) {
      widgets.add(
        ListElem(cartItem: n),
      );
    }
    return widgets;
  }
}
