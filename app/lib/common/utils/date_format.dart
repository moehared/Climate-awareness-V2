import 'package:intl/intl.dart';

// return format of the current date
// e.g Wed,12/8/2021 8:24:25 PM
String getCurrentDateFormat() {
  return DateFormat.yMEd().add_jms().format(DateTime.now());
}
