// ignore_for_file: unused_import, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../Widget/Custom_Button.dart';
import '../Widget/Custom_Hub.dart';

class S_Welcome extends StatefulWidget {
  @override
  State<S_Welcome> createState() => _S_WelcomeState();
}

class _S_WelcomeState extends State<S_Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/88.jpg')),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset('images/1.png'),
              ),
            ),
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 250, 208, 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: C_Button(
                  text: 'LOGIN',
                  On_Pressed: () {
                    Navigator.pushNamed(context, 'Key_Login');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: C_Button(
                  text: 'Registration',
                  On_Pressed: () {
                    Navigator.pushNamed(context, 'Key_Register');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
