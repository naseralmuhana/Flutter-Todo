import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// custom Snake Bar
class CustomSnakeBar {
  void showSnackBar(BuildContext context, FirebaseAuthException e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.message!),
        duration: Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      ),
    );
  }
}
