import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart(
      {Key? key,
      required this.color,
      required this.title,
      required this.onPress})
      : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  // primary: product.color,
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                onPressed: onPress,
                child: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    // backgroundColor: Colors.blue,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
