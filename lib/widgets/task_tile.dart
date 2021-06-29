import 'package:flutter/material.dart';
import 'package:todoey/utilities/constants.dart';
import 'package:todoey/utilities/extension.dart';

//! solution 1

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function onChangedCallback;
  final VoidCallback onLongPress;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.onChangedCallback,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle.capitalize(),
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: kCheckBoxActiveColor,
        value: isChecked,
        onChanged: onChangedCallback as void Function(bool?)?,
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

//! solution 2
// class TaskTile extends StatelessWidget {
//   final bool isChecked;
//   final String taskTitle;

//   const TaskTile({required this.isChecked, required this.taskTitle});

//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       activeColor: kCheckBoxActiveColor,
//       title: Text(
//         taskTitle,
//         style: TextStyle(
//           decoration: isChecked ? TextDecoration.lineThrough : null,
//           decorationThickness: kTextDecorationThickness,
//         ),
//       ),
//       value: isChecked,
//       onChanged: (value) => null,
//     );
//   }
// void toggleCheckBoxState(checkboxState) {
//   setState(() {
//     isChecked = checkboxState;
//   });
// }
// }
