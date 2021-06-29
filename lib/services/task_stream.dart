import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class TaskStream extends StatelessWidget {
  final user;

  TaskStream({this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('tasks').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        return Expanded(
          child: ListView(
            children: snapshot.data!.docs.map(
              (task) {
                if (task['user'] == user) {
                  return Text(task['name']);
                }
                return SizedBox();
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
