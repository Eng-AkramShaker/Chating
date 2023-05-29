// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, unused_import, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables, prefer_const_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Widget/Custom_Text_Filed.dart';
import '../Widget/Custom_ListView.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController Ch_controller = TextEditingController();

  final f_stor = FirebaseFirestore.instance;

  dynamic name_Email = FirebaseAuth.instance.currentUser?.email;
  String? Text_Message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/205.jpg')),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 400, top: 15),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 50,
                ),
                onPressed: (() {
                  print(name_Email);
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, 'Key_Login');
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 17),
              child: StreamBuilder<QuerySnapshot>(
                stream: f_stor
                    .collection('messages')
                    .orderBy('Time_now')
                    .snapshots(),
                builder: (context, snapshot) {
                  List<Line_message> all_messages = [];

                  if (!snapshot.hasData) {
                    print('no data----------');
                  } else {
                    final docs_message = snapshot.data!.docs.reversed;

                    for (var one_Docs in docs_message) {
                      final getText_in_Docs = one_Docs.get('Text');
                      final get_email_in_Docs = one_Docs.get('Email');

                      all_messages.add(
                        Line_message(
                          getData_in_Docs: getText_in_Docs,
                          is_Me: name_Email == get_email_in_Docs,
                        ),
                      );
                    }
                  }

                  return ListView(
                    reverse: true,
                    padding: EdgeInsets.only(left: 20),
                    children: all_messages,
                  );
                },
              ),
            ),
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                Container(
                  width: 380,
                  child: C_TextFild(
                    TEXT_controller: Ch_controller,
                    hint_text: '   Send Message ....',
                    ob_scure: false,
                    On_Change_TextFormFiled: (data) {
                      Text_Message = data;
                    },
                  ),
                ),
                SizedBox(width: 15),
                TextButton(
                  child: Icon(
                    Icons.send,
                    size: 50,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('messages').add(
                      {
                        'Text': Text_Message,
                        'Email': name_Email,
                        'Time_now': FieldValue.serverTimestamp(),
                      },
                    );
                    Ch_controller.clear();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
