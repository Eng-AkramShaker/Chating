// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable, file_names

import 'package:flutter/material.dart';

class C_TextFild extends StatelessWidget {
  C_TextFild(
      {required this.hint_text,
      required this.TEXT_controller,
      required this.ob_scure,
      required this.On_Change_TextFormFiled});
  final TEXT_controller;
  final hint_text;
  final ob_scure;
  Function(String) On_Change_TextFormFiled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,
      height: 55,
      child: TextFormField(
        controller: TEXT_controller,
        onChanged: On_Change_TextFormFiled,
        obscureText: ob_scure,
        decoration: InputDecoration(
          hintText: hint_text,
          hintStyle: TextStyle(color: Color.fromARGB(255, 131, 125, 125)),
          filled: true,
          fillColor: Color.fromARGB(255, 56, 18, 61),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Color.fromARGB(255, 58, 127, 255)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
