import 'package:intl/intl.dart';

class DateService {
  static String? getFormatedSlashDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    var formatDate = formatter.format(date);
    return formatDate;
  }
}
