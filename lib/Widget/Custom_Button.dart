// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unnecessary_question_mark, non_constant_identifier_names, must_be_immutable, prefer_const_constructors, override_on_non_overriding_member, sort_child_properties_last, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class C_Button extends StatelessWidget {
  C_Button({required this.text, required this.On_Pressed});
  String? text;
  void Function()? On_Pressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: On_Pressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 110, 136, 39), //shadow for button
                blurRadius: 14) //blur radius of shadow
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.0,
              0.2,
              0.8,
              1,
            ],
            colors: [
              
              HexColor('#6F304F'),
              HexColor('#1B1A2A'),
              HexColor('#1B1A2A'),
              HexColor('#6F304F'),
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
        child: Text('$text',
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 255, 243, 192),
            )),
      ),
    );
  }
}
