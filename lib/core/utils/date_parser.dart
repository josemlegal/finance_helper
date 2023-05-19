import 'package:intl/intl.dart';

String dateParser(DateTime date) {
  return DateFormat.yMMMMEEEEd().format(date);
}
