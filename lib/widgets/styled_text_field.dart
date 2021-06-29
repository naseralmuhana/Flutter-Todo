import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final InputDecoration decoration;
  final Function validator;
  final passwordFieldKey;
  final controller;
  final keyboardType;
  final obscureText;

  StyledTextField({
    required this.decoration,
    required this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.passwordFieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        key: passwordFieldKey,
        controller: controller,
        obscureText: obscureText ?? false,
        style: TextStyle(fontSize: 18.0),
        cursorColor: Colors.lightBlueAccent,
        decoration: decoration,
        validator: validator as String? Function(String?)?,
      ),
    );
  }
}
