import 'package:intl/intl.dart';

class Formatter {
  static String requisitionDate(DateTime d) {
    return DateFormat('yyyy-MM-dd').format(d);
  }

  static String displayDate(d) {
    final _date = DateTime.tryParse(d.toString());
    return _date != null ? DateFormat('dd/MM/yyyy').format(_date) : '';
  }
}
