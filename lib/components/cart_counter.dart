import 'package:ecommerce/components/alert_dialog.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/reducers/actions/add_to_cart_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redux/redux.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  final CartItem item;
  const CartCounter({Key? key, required this.item}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  void addQuantity() {
    StoreProvider.of<AppState>(context).dispatch(AddQuantityAction(CartItem(
        id: widget.item.id,
        image: widget.item.image,
        title: widget.item.title,
        productId: widget.item.productId,
        price: widget.item.price,
        description: widget.item.description,
        quantity: widget.item.quantity)));
  }

  void minusQuantity() {
    StoreProvider.of<AppState>(context).dispatch(MinusQuantityAction(CartItem(
        id: widget.item.id,
        image: widget.item.image,
        title: widget.item.title,
        productId: widget.item.productId,
        price: widget.item.price,
        description: widget.item.description,
        quantity: widget.item.quantity)));
  }

  void removeItem() {
    StoreProvider.of<AppState>(context).dispatch(RemoveItemAction(CartItem(
        id: widget.item.id,
        image: widget.item.image,
        title: widget.item.title,
        productId: widget.item.productId,
        price: widget.item.price,
        description: widget.item.description,
        quantity: widget.item.quantity)));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<CartItem>>(
      converter: (Store<AppState> store) => store.state.cartItem,
      builder: (context, callback) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                buildOutlineButton(
                  icon: Icons.remove,
                  press: () {
                    if (widget.item.quantity > 1) {
                      minusQuantity();
                    } else {
                      showAlertDialog(
                          context,
                          'Are you sure you want to delete ?',
                          widget.item.title,
                          removeItem,
                          null);
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin / 2),
                  child: Text(
                    // if our item is less  then 10 then  it shows 01 02 like that
                    widget.item.quantity.toString().padLeft(2, "0"),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                buildOutlineButton(
                    icon: Icons.add,
                    press: () {
                      addQuantity();
                    }),
              ],
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/delete.svg',
                color: Colors.red,
                height: kDefaultPaddin,
              ),
              onPressed: () => showAlertDialog(
                  context,
                  'Are you sure you want to delete ?',
                  widget.item.title,
                  removeItem,
                  null),
            )
          ],
        );
      },
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 30,
      height: 30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: BorderSide(color: (Colors.grey[400])!, width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
