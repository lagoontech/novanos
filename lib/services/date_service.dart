import 'package:intl/intl.dart';

class DateService {
  static String? getFormatedSlashDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    var formatDate = formatter.format(date);
    return formatDate;
  }

  static String? getFormatedhypenDate(DateTime date) {
    DateFormat formatter = DateFormat('MM-dd-yyyy');
    var formatDate = formatter.format(date);
    return formatDate;
  }

  static String getStartDateOfMonthhypenDate() {
    DateTime now = DateTime.now();
    var beginningPastMonth = (now.month < 12)
        ? DateTime(now.year, now.month, 1)
        : DateTime(now.year - 1, 1, 1);

    return getFormatedhypenDate(beginningPastMonth).toString();
  }
}
