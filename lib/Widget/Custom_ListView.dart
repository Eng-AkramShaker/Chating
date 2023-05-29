// ignore: todo
// TODO Implement this library.
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names, camel_case_types, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Line_message extends StatelessWidget {
  const Line_message({required this.getData_in_Docs, required this.is_Me});

  final getData_in_Docs;
  final bool is_Me;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            is_Me ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Material(
            elevation: 50,
            borderRadius:is_Me? BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ) : BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
              bottomLeft: Radius.circular(28),
            ),
            color: is_Me
                ? Color.fromARGB(221, 6, 143, 102)
                : Color.fromARGB(255, 238, 139, 139),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '$getData_in_Docs',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
