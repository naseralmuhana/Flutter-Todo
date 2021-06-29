import 'package:flutter/material.dart';

const String kTitleText = 'ToDoey';

const double kCircleAvatarRadius = 30.0;
const double kCircleAvatarIconSize = 40.0;
const double kTextDecorationThickness = 3.5;
const double kRoundedButtonHeight = 70.0;

const Color kCircleAvatarColor = Colors.white;
const Color kScaffoldBackgroundColor = Colors.lightBlueAccent;
const Color kCircleAvatarIconColor = Colors.lightBlueAccent;
const Color kFloatingActionButtonColor = Colors.lightBlueAccent;
const Color kBottomSheetBackgroundColor = Color(0xFF757575);
const Color kElevatedButtonColor = Colors.lightBlueAccent;
const Color kCheckBoxActiveColor = Colors.lightBlueAccent;
const Color kTextDecorationColor = Colors.lightBlueAccent;
const Color kRoundedButtonColor = Colors.lightBlueAccent;

const Size kElevatedButtonMinimumSize = Size(363, 56);
const Duration kAnimatedTextKitSpeed = Duration(milliseconds: 400);
const Duration kAnimatedTextKitPause = Duration(milliseconds: 1000);

const IconData kFloatingActionIcon = Icons.add;
const IconData kCircleAvatarIcon = Icons.list;

const EdgeInsets kTitleConainterPadding =
    EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 30.0);
const EdgeInsets kContentConainterPadding =
    EdgeInsets.symmetric(horizontal: 20.0);
const EdgeInsets kSignUpContentConainterPadding =
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0);
const EdgeInsets kSignInContentConainterPadding =
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0);
const EdgeInsets kFloatingActionButtonPadding = EdgeInsets.all(8.0);
const EdgeInsets kBottomSheetPadding =
    EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0);
const EdgeInsets kSignUpInTitlePadding =
    EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0);
const EdgeInsets kRoundedButtonPadding = const EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 20,
);

const TextStyle kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
);
const TextStyle kTasksNumberTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
);
const TextStyle kTextFieldTextStyle = TextStyle(
  fontSize: 20.0,
);
const TextStyle kBottomSheetTitleTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 30.0,
);
const TextStyle kSignUpTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
);
const TextStyle kRoundedButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);

const BoxDecoration kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.elliptical(50, 50),
    topRight: Radius.elliptical(50, 50),
  ),
);

const InputDecoration kTextFieldDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 3,
    ),
  ),
);

const InputDecoration kTextFormFieldDecoration = InputDecoration(
  hintText: 'Name',
  hintStyle: TextStyle(fontSize: 18.0),
  contentPadding: EdgeInsets.all(25),
  prefixIcon: Icon(
    Icons.lock,
    color: Colors.lightBlueAccent,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);

const ShapeBorder kBottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
);
