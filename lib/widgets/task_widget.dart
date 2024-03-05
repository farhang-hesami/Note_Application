import 'package:flutter/material.dart';
import 'package:flutter_application_note/constants/color_constants.dart';
import 'package:flutter_application_note/models/task.dart';
import 'package:flutter_application_note/screens/edit_task_screen.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        height: 132.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: getMainContent(),
        ),
      ),
    );
  }

  Widget getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: BorderSide(
                        width: 1.2,
                        color: kLightGreyColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      checkColor: kwhiteColor,
                      activeColor: kGreenColor,
                      value: isBoxChecked,
                      onChanged: (isChecked) {},
                    ),
                  ),
                  Text(
                    widget.task.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              getTimeAndEditBadgs(),
            ],
          ),
        ),
        SizedBox(width: 15.0),
        Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Widget getTimeAndEditBadgs() {
    return Row(
      children: [
        Container(
          width: 95.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: kGreenColor,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Row(
              children: [
                Text(
                  '${widget.task.time.hour}:${getMinUnderTen(widget.task.time)}',
                  style: TextStyle(
                    color: kwhiteColor,
                  ),
                ),
                SizedBox(width: 15.0),
                Image.asset('assets/images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 15.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditTaskScreen(task: widget.task);
                },
              ),
            );
          },
          child: Container(
            width: 95.0,
            height: 28.0,
            decoration: BoxDecoration(
              color: kLightGreenColor,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: kGreenColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: 18.0),
                  Image.asset('assets/images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getMinUnderTen(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
