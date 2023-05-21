String todayDate() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Output: 2023-05-21
  return "${now.year}-${now.month}-${now.day}";
}
