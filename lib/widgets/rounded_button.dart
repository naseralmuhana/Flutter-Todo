import 'package:flutter/material.dart';
import 'package:todoey/utilities/constants.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonLabel;

  RoundedButton({
    this.onPressed,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kRoundedButtonPadding,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonLabel,
          style: kRoundedButtonTextStyle,
        ),
        height: kRoundedButtonHeight,
        minWidth: double.infinity,
        color: kRoundedButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
