import 'package:flutter/material.dart';

class FireBaseErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.error),
              Text('Something went wrong !'),
            ],
          ),
        ),
      ),
    );
  }
}
