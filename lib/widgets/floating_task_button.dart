import 'package:flutter/material.dart';
import 'package:todoey/utilities/constants.dart';
import 'package:todoey/screens/add_task_screen.dart';

class FloatingTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kFloatingActionButtonColor,
      child: Icon(kFloatingActionIcon),
      onPressed: () => showModalBottomSheet(
        enableDrag: true,
        shape: kBottomSheetShape,
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddTaskScreen(),
          ),
        ),
      ),
    );
  }
}
