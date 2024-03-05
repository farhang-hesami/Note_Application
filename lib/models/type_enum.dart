import 'package:hive/hive.dart';
part 'type_enum.g.dart';

@HiveType(typeId: 5)
enum TaskTypeEnum {
  @HiveField(0)
  work,
  @HiveField(1)
  focus,
  @HiveField(2)
  bank,
  @HiveField(3)
  sport,
  @HiveField(4)
  date,
  @HiveField(5)
  workmeeting,
}
