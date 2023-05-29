// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class Widget_Divider extends StatelessWidget {
  const Widget_Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 130,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 2, bottom: 5),
                child: Container(
                  alignment: Alignment.center,
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text('OR'),
                ),
              ),
              Container(
                width: 130,
                child: Divider(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/gmail.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/facebook.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/whatsapp.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/sn.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
