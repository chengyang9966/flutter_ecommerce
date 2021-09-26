import 'package:ecommerce/utils/convert_number_price.dart';

String shoppingCost(int number) {
  var temp = 0;
  if (number > 10) {
    temp = number * 8;
    return '+ ${convertNumberToPrice(temp.toString())} ';
  } else {
    temp = number * 5;
    return '+ ${convertNumberToPrice(temp.toString())} ';
  }
}
