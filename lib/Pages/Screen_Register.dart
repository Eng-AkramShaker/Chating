// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, implementation_imports, unnecessary_import, camel_case_types, unnecessary_brace_in_string_interps, sort_child_properties_last, non_constant_identifier_names, file_names, unused_local_variable, avoid_print, use_build_context_synchronously, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:hexcolor/hexcolor.dart';

import '../Widget/Custom_Button.dart';
import '../Widget/Custom_Hub.dart';
import '../Widget/Custom_Text_Filed.dart';
import '../Widget/Divider.dart';
import '../Widget/Snack_Bar.dart';

class Regisret extends StatefulWidget {
  @override
  State<Regisret> createState() => _RegisretState();
}

class _RegisretState extends State<Regisret> {
  dynamic Email;
  dynamic Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProgressHUD(
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/2.jpg')),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, bottom: 25, left: 50, right: 50),
                      child: Container(
                        height: 250,
                        width: 100,
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 150,
                                height: 150,
                                child: Image.asset('images/1.png'),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 250, 208, 20),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 10, left: 10, right: 8),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'User Name',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              width: 140,
                                            ),
                                            Icon(
                                              Icons.person,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        C_TextFild(
                                          hint_text: ' Akram Shaker',
                                          ob_scure: false,
                                          On_Change_TextFormFiled: (data) {},
                                          TEXT_controller: null,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'E-Mail',
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 160,
                                        ),
                                        Icon(
                                          Icons.email,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  C_TextFild(
                                    hint_text: ' example @gmail.com',
                                    ob_scure: false,
                                    On_Change_TextFormFiled: (data) {
                                      Email = data;
                                    },
                                    TEXT_controller: null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Password',
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 130,
                                        ),
                                        Icon(
                                          Icons.lock,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  C_TextFild(
                                    hint_text: ' Password',
                                    ob_scure: true,
                                    On_Change_TextFormFiled: (data) {
                                      Password = data;
                                    },
                                    TEXT_controller: null,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: C_Button(
                                text: 'Regisret',
                                On_Pressed: () async {
                                  setState(() {
                                    Custom_Hub(context);
                                  });
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: Email,
                                      password: Password,
                                    );

                                    Snak_Bar(context, 'Successful ');

                                    Navigator.pop(context);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      Snak_Bar(context, 'Weak-Password ');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      Snak_Bar(
                                          context, ' Email already in Use ');
                                    }
                                  }
                                  setState(() {
                                    ProgressHUD.of(context)?.dismiss();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Do you have an account ?',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                  Text_login(),
                                ],
                              ),
                            ),
                            Widget_Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}

class Text_login extends StatefulWidget {
  @override
  State<Text_login> createState() => _Text_loginState();
}

class _Text_loginState extends State<Text_login> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Key_Login');
        },
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 17),
        ));
  }
}
