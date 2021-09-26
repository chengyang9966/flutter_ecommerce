import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/total_amount.dart';
import 'package:ecommerce/utils/convert_number_price.dart';

CartTotalAmount totalAmount(List<CartItem> items) {
  var price = 0;
  var shippingCost = '';
  var temp = 0;
  var totalShopingAmount = 0;
  for (var item in items) {
    price = price + (item.quantity * item.price);
  }
  if (items.length > 10) {
    temp = items.length * 8;
    shippingCost = '+ ${convertNumberToPrice(temp.toString())} ';
  } else {
    temp = items.length * 5;
    shippingCost = '+ ${convertNumberToPrice(temp.toString())} ';
  }
  totalShopingAmount = price + temp;

  return (CartTotalAmount(
    total: convertNumberToPrice(totalShopingAmount.toString()),
    shippingCost: shippingCost,
    subTotal: convertNumberToPrice(price.toString()),
  ));
}
