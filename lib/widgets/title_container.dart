import 'package:flutter/cupertino.dart';
import 'package:todoey/utilities/constants.dart';
import 'package:todoey/widgets/animated_title.dart';

/// The upper container in the Sign up and Sign In page.
class TitleContainer extends StatelessWidget {
  final String titleLabel;

  TitleContainer({
    required this.titleLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kSignUpInTitlePadding,
      child: Column(
        children: [
          Text(
            titleLabel,
            style: kSignUpTitleTextStyle,
          ),
          SizedBox(
            height: 15.0,
          ),
          AnimatedTitle(),
        ],
      ),
    );
  }
}
