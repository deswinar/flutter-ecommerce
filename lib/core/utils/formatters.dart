import 'package:intl/intl.dart';

class Formatters {
  static String formatPrice(int price) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(price);
  }
}
