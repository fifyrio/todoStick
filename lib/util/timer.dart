import 'package:intl/intl.dart';

class TimeUtils {
  static List<String> formatTitleDate(String dateString) {
    DateTime inputDate = DateTime.parse(dateString);
    String weekday = DateFormat('EEEE').format(inputDate); // 'Sunday'
    String date = DateFormat('MMMM d, y').format(inputDate); // 'March 17, 2024'
    return [weekday, date];
  }

  static List<String> formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);

    String month = DateFormat('MMM').format(date).toUpperCase(); // 'MAR'
    String day = DateFormat('d').format(date); // '17'
    String dow = DateFormat('EEE').format(date).toUpperCase(); // 'SUN'
    return [month, day, dow];
  }

  static int getCurrentDateIndex(List<String> dates ) {
    DateTime now = DateTime.now();
    DateTime currentTime = DateTime.parse(now.toString());
    DateTime targetDate = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
    );

    int index = dates.indexWhere((date) => date.toString() == targetDate.toString());
    if (index == -1) {
      return 0;
    } else {
      return index;
    }
  }

  static List<String> getDateRange() {
    List<String> dateRange = [];
    DateTime now = DateTime.now();
    DateTime currentTime = DateTime.parse(now.toString());
    DateTime beginningOfDay = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
    );

    for (int i = 100; i > 0; i--) {
      dateRange.add(beginningOfDay.subtract(Duration(days: i)).toString());
    }

    dateRange.add(beginningOfDay.toString());

    for (int i = 1; i <= 100; i++) {
      dateRange.add(beginningOfDay.add(Duration(days: i)).toString());
    }

    print(beginningOfDay.toString());

    return dateRange;
  }
}
