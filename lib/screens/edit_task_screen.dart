import 'package:flutter/material.dart';
import 'package:flutter_application_note/constants/color_constants.dart';
import 'package:flutter_application_note/models/Task_Type_Item_List.dart';
import 'package:flutter_application_note/models/task.dart';
import 'package:flutter_application_note/models/utilitu.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode isFocus1 = FocusNode();
  FocusNode isFocus2 = FocusNode();

  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  var box = Hive.box<Task>('taskBox');
  DateTime? _time;
  int _selectedTaskTypeItem = 0;
  @override
  void initState() {
    super.initState();
    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subTitle);

    isFocus1.addListener(() {
      setState(() {});
    });
    isFocus2.addListener(() {
      setState(() {});
    });
    var index = getTaskTypeList().indexWhere((element) {
      return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
    });
    _selectedTaskTypeItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: TextField(
                cursorColor: kGreenColor,
                controller: controllerTaskTitle,
                focusNode: isFocus1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  labelText: 'Task',
                  labelStyle: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 18.0,
                    color: isFocus1.hasFocus ? kGreenColor : kLightGreyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC5C5C5),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kGreenColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: TextField(
                cursorColor: kGreenColor,
                controller: controllerTaskSubTitle,
                maxLines: 2,
                focusNode: isFocus2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  labelText: 'Direction',
                  labelStyle: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 18.0,
                    color: isFocus2.hasFocus ? kGreenColor : kLightGreyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC5C5C5),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kGreenColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            CustomHourPicker(
              title: 'choose a Time',
              titleStyle: TextStyle(
                color: kGreenColor,
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
              ),
              negativeButtonText: 'delete',
              negativeButtonStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
              positiveButtonText: 'ok',
              positiveButtonStyle: TextStyle(
                color: kGreenColor,
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
              elevation: 2.0,
              onPositivePressed: (context, time) {
                _time = time;
              },
              onNegativePressed: (context) {},
            ),
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getTaskTypeList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTaskTypeItem = index;
                      });
                    },
                    child: TaskTypeItemList(
                      taskType: getTaskTypeList()[index],
                      index: index,
                      selectedItemList: _selectedTaskTypeItem,
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kGreenColor,
                minimumSize: Size(170.0, 48.0),
                elevation: 0.0,
              ),
              onPressed: () {
                String taskTitle = controllerTaskTitle!.text;
                String taskSubTitle = controllerTaskSubTitle!.text;
                editTask(taskTitle, taskSubTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Edit Task',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTaskTypeItem];
    widget.task.save();
  }

  @override
  void dispose() {
    isFocus1.dispose();
    isFocus2.dispose();
    super.dispose();
  }
}
