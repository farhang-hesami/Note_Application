import 'package:flutter/material.dart';
import 'package:flutter_application_note/constants/color_constants.dart';
import 'package:flutter_application_note/models/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedItemList,
  });
  TaskType taskType;
  int index;
  int selectedItemList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selectedItemList == index ? kGreenColor : kwhiteColor,
        border: Border.all(
          width: selectedItemList == index ? 3.0 : 1.0,
          color: selectedItemList == index ? kGreenColor : kLightGreyColor,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.all(8),
      width: 140.0,
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
              fontSize: 18,
              color: selectedItemList == index ? kwhiteColor : kblackColor,
            ),
          ),
        ],
      ),
    );
  }
}
