import 'package:flutter_application_note/models/task_type.dart';
import 'package:flutter_application_note/models/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var List = [
    TaskType(
      image: ('assets/images/meditate.png'),
      title: 'Focus',
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: ('assets/images/social_frends.png'),
      title: 'Friendly date',
      taskTypeEnum: TaskTypeEnum.date,
    ),
    TaskType(
      image: ('assets/images/hard_working.png'),
      title: 'Work',
      taskTypeEnum: TaskTypeEnum.work,
    ),
    TaskType(
      image: ('assets/images/workout.png'),
      title: 'Sport',
      taskTypeEnum: TaskTypeEnum.sport,
    ),
    TaskType(
      image: ('assets/images/banking.png'),
      title: 'Bank',
      taskTypeEnum: TaskTypeEnum.bank,
    ),
    TaskType(
      image: ('assets/images/work_meeting.png'),
      title: 'workmeeting',
      taskTypeEnum: TaskTypeEnum.workmeeting,
    ),
  ];
  return List;
}
