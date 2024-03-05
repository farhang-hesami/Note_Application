import 'package:flutter_application_note/models/task_type.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 3)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  bool isDone;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  TaskType taskType;

  Task(
      {required this.title,
      required this.subTitle,
      this.isDone = false,
      required this.time,
      required this.taskType});
}