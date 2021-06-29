import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class PasswordVisibility extends StatelessWidget {
  const PasswordVisibility({
    required this.obscureText,
    this.label,
  });

  final bool obscureText;
  final label;

  @override
  Widget build(BuildContext context) {
    final povider = Provider.of<TaskData>(context, listen: false);
    return GestureDetector(
      onTap: label != null
          ? povider.toggleFirstObscureText
          : povider.toggleSecondObscureText,
      child: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
