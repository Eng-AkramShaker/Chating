// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fristnnn/Pages/Screen_Chat.dart';
import 'Pages/Screen_Login.dart';
import 'Pages/Screen_Register.dart';
import 'Pages/Screen_Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic name_Email = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: name_Email != null ? Chat() : S_Welcome(),
      routes: {
        'Key_Register': (context) => Regisret(),
        'Key_Login': (context) => Login(),
        'Key_Chat': (context) => Chat(),
      },
    );
  }
}
