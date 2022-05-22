import 'package:intl/intl.dart';

class Util {
  // Convert the date returned from openweathermap to a user friendly format
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}
