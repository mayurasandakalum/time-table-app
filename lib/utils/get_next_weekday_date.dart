String getNextWeekdayDate(String weekdayName) {
  DateTime now = DateTime.now();

  // Find the next occurrence of the given weekday
  int currentWeekday = now.weekday;
  int targetWeekday = DateTime.monday; // Default to Monday
  switch (weekdayName.toLowerCase()) {
    case 'monday':
      targetWeekday = DateTime.monday;
      break;
    case 'tuesday':
      targetWeekday = DateTime.tuesday;
      break;
    case 'wednesday':
      targetWeekday = DateTime.wednesday;
      break;
    case 'thursday':
      targetWeekday = DateTime.thursday;
      break;
    case 'friday':
      targetWeekday = DateTime.friday;
      break;
    case 'saturday':
      targetWeekday = DateTime.saturday;
      break;
    case 'sunday':
      targetWeekday = DateTime.sunday;
      break;
  }

  int daysToAdd = targetWeekday - currentWeekday;
  if (daysToAdd <= 0) {
    daysToAdd += 7;
  }

  DateTime relevantDate = now.add(Duration(days: daysToAdd));

  String formattedMonth = relevantDate.month.toString().padLeft(2, '0');
  String formattedDay = relevantDate.day.toString().padLeft(2, '0');

  return "${relevantDate.year}-$formattedMonth-$formattedDay";
}
