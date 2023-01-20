import 'package:flutter/material.dart';
import 'package:flutter_firebase_test_app/auth/login_screen.dart';

void mainCommon(String flavor) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(
        flavor: flavor,
      ),
    ),
  );
}
