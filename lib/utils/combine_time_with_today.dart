import 'package:intl/intl.dart';

DateTime combineTimeWithToday(String time) {
  final currentDate = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
  final combinedDateTimeString = '$formattedDate $time';
  final combinedDateTime =
      DateFormat('yyyy-MM-dd hh.mm a').parse(combinedDateTimeString);

  return combinedDateTime;
}
