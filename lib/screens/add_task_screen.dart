import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/utilities/constants.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: kBottomSheetPadding,
      child: Column(
        children: <Widget>[
          Text(
            'Add Task',
            style: kBottomSheetTitleTextStyle,
          ),
          TextField(
            onChanged: (value) => newTaskTitle = value,
            autofocus: true,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            style: kTextFieldTextStyle,
            decoration: kTextFieldDecoration,
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kElevatedButtonColor,
              minimumSize: kElevatedButtonMinimumSize,
            ),
            child: Text('Add'),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
