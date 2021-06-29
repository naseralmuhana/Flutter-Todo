import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey/screens/authentication/sign_in.dart';
import 'package:todoey/screens/authentication/sign_up.dart';
import 'package:todoey/widgets/error_widget.dart';
import 'package:todoey/widgets/loading_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'models/task_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return FireBaseErrorWidget();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Todoey();
        } else {
          return FireBaseLoadingWidget();
        }
      },
    );
  }
}

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? SignIn.id
            : TasksScreen.id,
        routes: {
          SignUp.id: (context) => SignUp(),
          SignIn.id: (context) => SignIn(),
          TasksScreen.id: (context) => TasksScreen(),
        },
      ),
    );
  }
}
