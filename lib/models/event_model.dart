import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 1)
class Event {
  Event({
    required this.from,
    required this.to,
    required this.moduleCode,
    required this.moduleName,
    required this.title,
    required this.building,
    required this.floor,
    required this.hallNumber,
    required this.instructorName,
    required this.backgroundColorValue,
  });

  @HiveField(0)
  DateTime from;

  @HiveField(1)
  DateTime to;

  @HiveField(2)
  String moduleCode;

  @HiveField(3)
  String moduleName;

  @HiveField(4)
  String title;

  @HiveField(5)
  String building;

  @HiveField(6)
  String floor;

  @HiveField(7)
  String hallNumber;

  @HiveField(8)
  String instructorName;

  @HiveField(9)
  int backgroundColorValue;
}
