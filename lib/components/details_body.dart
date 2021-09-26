import 'package:ecommerce/components/details_add_to_cart.dart';
import 'package:ecommerce/components/details_detail.dart';
import 'package:ecommerce/components/details_product_title_with_image.dart';
import 'package:ecommerce/components/toast_msg.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/reducers/actions/add_to_cart_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class BodyDetails extends StatefulWidget {
  final Product product;
  const BodyDetails({Key? key, required this.product}) : super(key: key);

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  // List<CartItem> cartItems = [];
  var index = 0;
  void addItemToCart(int number) {
    StoreProvider.of<AppState>(context).dispatch(AddItemAction(CartItem(
        id: number++,
        image: widget.product.image,
        title: widget.product.title,
        productId: widget.product.id,
        price: widget.product.price,
        description: widget.product.description,
        quantity: 1)));
    toastMessage('Add To Cart Successfully');
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const AddtoCartScreen(),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StoreConnector<AppState, List<CartItem>>(
        converter: (Store<AppState> store) => store.state.cartItem,
        builder: (context, List<CartItem> cartItem) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.4),
                        padding: const EdgeInsets.only(
                          left: kDefaultPaddin,
                          right: kDefaultPaddin,
                        ),
                        // height: 500,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Description(product: widget.product),
                            const SizedBox(height: kDefaultPaddin * 4),
                            AddToCart(
                              color: widget.product.color,
                              title: 'Add to Cart',
                              onPress: () => addItemToCart(cartItem.length),
                            )
                          ],
                        ),
                      ),
                      ProductTitleWithImage(product: widget.product)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
  // It provide us total height and width

}
