import 'package:intl/intl.dart';

class FormartUtils {
  FormartUtils._();
  static String formatDate(DateTime date) {
    return DateFormat.yMMMd().add_jm().format(date);
  }
}
