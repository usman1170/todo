import 'package:intl/intl.dart';

class MyDateUtils {
  static String getDateWithMonthName(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  static String getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  static String getFormattedTime(DateTime date) {
    return DateFormat('h:mm:ss a').format(date);
  }

  static String getTimeWithoutSeconds(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  static String getDashedDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
