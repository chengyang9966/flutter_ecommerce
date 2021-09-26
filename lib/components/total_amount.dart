import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/utils/total_amount_count.dart';
import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  final List<CartItem> items;
  const TotalAmount({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: kDefaultPaddin / 4, bottom: kDefaultPaddin / 4),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Order Info',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        TextWidget(title: 'Subtotal', subtitle: totalAmount(items).subTotal),
        TextWidget(
            title: 'Shipping Cost', subtitle: totalAmount(items).shippingCost),
        TextWidget(title: 'Total Amount', subtitle: totalAmount(items).total),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPaddin / 4, bottom: kDefaultPaddin / 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )),
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
