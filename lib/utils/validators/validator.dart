import 'package:intl/intl.dart';

String? validateDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a date';
  }
  try {
    final DateFormat formatter = DateFormat('dd-MM-yy');
    final DateTime parsedDate = formatter.parseStrict(value);

    if (parsedDate.day > 31) {
      return 'Day cannot be greater than 31';
    }
    if (parsedDate.month > 12) {
      return 'Month cannot be greater than 12';
    }

    int maxDay;
    switch (parsedDate.month) {
      case 2:
        final bool isLeapYear = (parsedDate.year % 4 == 0 &&
            (parsedDate.year % 100 != 0 || parsedDate.year % 400 == 0));
        maxDay = isLeapYear ? 29 : 28;
        break;
      case 4:
      case 6:
      case 9:
      case 11:
        maxDay = 30;
        break;
      default:
        maxDay = 31;
    }
    if (parsedDate.day > maxDay) {
      return 'Invalid day for the selected month.';
    }
    if (parsedDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return 'Please do not select a date from the past.';
    }

    return null;
  } catch (e) {
    return 'Invalid date format. Use dd-mm-yy.';
  }
}
