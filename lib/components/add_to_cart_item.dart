import 'package:ecommerce/components/alert_dialog.dart';
import 'package:ecommerce/components/cart_counter.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/reducers/actions/add_to_cart_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:ecommerce/utils/convert_number_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ListElem extends StatelessWidget {
  final CartItem cartItem;

  const ListElem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    removeItem() {
      StoreProvider.of<AppState>(context).dispatch(RemoveItemAction(CartItem(
          id: cartItem.id,
          image: cartItem.image,
          title: cartItem.title,
          productId: cartItem.productId,
          price: cartItem.price,
          description: cartItem.description,
          quantity: cartItem.quantity)));
      return true;
    }

    cancelItem() {
      return false;
    }

    return StoreConnector<AppState, List<CartItem>>(
        converter: (Store<AppState> store) => store.state.cartItem,
        builder: (context, callback) {
          return Container(
            height: 160,
            color: (Colors.grey[200])!,
            margin: const EdgeInsets.only(
                top: kDefaultPaddin / 4, bottom: kDefaultPaddin / 4),
            child: Dismissible(
              key: Key(cartItem.id.toString()),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.startToEnd) {
                  print("Add to favorite");
                } else {
                  print('Remove item');
                }
              },
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Delete Confirmation"),
                      content: Text(
                        "Are you sure you want to delete this item?",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                            onPressed: () =>
                                {Navigator.of(context).pop(true), removeItem()},
                            child: const Text("Delete")),
                      ],
                    );
                  },
                );
              },
              background: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: const [
                      Icon(Icons.money_off, color: Colors.white),
                      SizedBox(
                        width: kDefaultPaddin / 5,
                      ),
                      Text('Pay Later', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.delete, color: Colors.white),
                      SizedBox(
                        width: kDefaultPaddin / 5,
                      ),
                      Text('Move to trash',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //The image
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kDefaultPaddin / 2),
                          boxShadow: [
                            BoxShadow(
                              color: (Colors.grey[200])!,
                              offset: const Offset(10.0, 10.0),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            alignment: FractionalOffset.topCenter,
                            image: AssetImage(
                              cartItem.image,
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //The title
                          const SizedBox(height: kDefaultPaddin),
                          Text(
                            cartItem.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: kDefaultPaddin / 2),
                          Text(
                            convertNumberToPrice(cartItem.price.toString()),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: kDefaultPaddin),
                          //The content
                          CartCounter(item: cartItem),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
