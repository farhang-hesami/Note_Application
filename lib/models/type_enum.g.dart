// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 5;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.work;
      case 1:
        return TaskTypeEnum.focus;
      case 2:
        return TaskTypeEnum.bank;
      case 3:
        return TaskTypeEnum.sport;
      case 4:
        return TaskTypeEnum.date;
      case 5:
        return TaskTypeEnum.workmeeting;
      default:
        return TaskTypeEnum.work;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.work:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.focus:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.bank:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.sport:
        writer.writeByte(3);
        break;
      case TaskTypeEnum.date:
        writer.writeByte(4);
        break;
      case TaskTypeEnum.workmeeting:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
