// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 1;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      from: fields[0] as DateTime,
      to: fields[1] as DateTime,
      moduleCode: fields[2] as String,
      moduleName: fields[3] as String,
      title: fields[4] as String,
      building: fields[5] as String,
      floor: fields[6] as String,
      hallNumber: fields[7] as String,
      instructorName: fields[8] as String,
      backgroundColorValue: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.from)
      ..writeByte(1)
      ..write(obj.to)
      ..writeByte(2)
      ..write(obj.moduleCode)
      ..writeByte(3)
      ..write(obj.moduleName)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.building)
      ..writeByte(6)
      ..write(obj.floor)
      ..writeByte(7)
      ..write(obj.hallNumber)
      ..writeByte(8)
      ..write(obj.instructorName)
      ..writeByte(9)
      ..write(obj.backgroundColorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
