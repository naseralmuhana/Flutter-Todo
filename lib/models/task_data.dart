import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  bool showSpinner = false;
  bool firstObscureText = true;
  bool secondObscureText = true;
  List<Task> _tasks = [];

  /// To get the [_tasks] list without modify it;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  /// To get the [_tasks] count;
  int get taskCount => _tasks.length;

  /// To add a new task to the [_tasks] list
  /// and notify the listener to rebuild their widgets to update the [_tasks] list;
  void addTask(taskTitle) {
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  /// To toggle the checkbox by using the taskindex that we got from the [TasksList]
  /// and notify the listener to rebuild their widgets to update the state;
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  /// To delet any task from the [_tasks] list
  /// and notify the listener to rebuild their widgets to update the state;
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // To toggle the spinner loading screen during sign up
  void toggleSpinner() {
    showSpinner = !showSpinner;
    notifyListeners();
  }

  void toggleFirstObscureText() {
    firstObscureText = !firstObscureText;
    notifyListeners();
  }

  void toggleSecondObscureText() {
    secondObscureText = !secondObscureText;
    notifyListeners();
  }
}
