import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/authentication/sign_in.dart';
import 'package:todoey/services/auth_service.dart';

import 'package:todoey/utilities/constants.dart';
import 'package:todoey/utilities/extension.dart';
import 'package:todoey/widgets/floating_task_button.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  static String id = 'tasks_screen';

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late User loggedInUser;
  AuthService _authService = AuthService();

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      floatingActionButton: Padding(
        padding: kFloatingActionButtonPadding,
        child: FloatingTaskButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: kTitleConainterPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: kCircleAvatarColor,
                      radius: kCircleAvatarRadius,
                      child: Icon(
                        kCircleAvatarIcon,
                        color: kCircleAvatarIconColor,
                        size: kCircleAvatarIconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: signOutOnTap,
                      child: CircleAvatar(
                        backgroundColor: kCircleAvatarColor,
                        radius: kCircleAvatarRadius,
                        child: Icon(
                          Icons.logout,
                          color: kCircleAvatarIconColor,
                          size: kCircleAvatarIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  kTitleText.capitalize(),
                  style: kTitleTextStyle,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: kTasksNumberTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: kContentConainterPadding,
              decoration: kContainerDecoration,
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }

  void getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOutOnTap() async {
    await _authService.signOut();
    await Navigator.pushNamedAndRemoveUntil(
      context,
      SignIn.id,
      (route) => false,
    );
  }
}
