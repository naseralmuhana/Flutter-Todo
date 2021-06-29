import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utilities/constants.dart';

/// the todo image and the animated text that.
class AnimatedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(right: 8.0),
          child: Image.asset('images/white-todo.png'),
          height: 50.0,
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              kTitleText,
              textStyle: kTitleTextStyle,
              speed: kAnimatedTextKitSpeed,
            ),
          ],
          pause: kAnimatedTextKitPause,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
          repeatForever: true,
        ),
      ],
    );
  }
}
