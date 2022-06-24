import 'package:intl/src/intl/number_format.dart';

String formateAmount(int amount) {
  var formatter = NumberFormat('###,###,###,###,##0');

  return formatter.format(amount);
}
