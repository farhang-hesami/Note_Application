import 'package:flutter/material.dart';
import 'package:flutter_application_note/models/task.dart';
import 'package:flutter_application_note/models/task_type.dart';
import 'package:flutter_application_note/models/type_enum.dart';
import 'package:flutter_application_note/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('names');
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GM',
      ),
      home: HomeScreen(),
    );
  }
}
