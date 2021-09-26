import 'package:intl/intl.dart';

String convertNumberToPrice(number) {
  var eurosInUSFormat = NumberFormat.currency(locale: "en_US", symbol: "RM ");
  return eurosInUSFormat.format(int.parse(number));
}

String convertNumberToPriceNoDecimal(number) {
  var eurosInUSFormat =
      NumberFormat.currency(locale: "en_US", symbol: "RM ", decimalDigits: 0);
  return eurosInUSFormat.format(int.parse(number));
}
