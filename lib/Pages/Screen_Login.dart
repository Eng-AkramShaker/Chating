// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, implementation_imports, unnecessary_import, camel_case_types, unnecessary_brace_in_string_interps, sort_child_properties_last, file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_print, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Widget/Custom_Button.dart';
import '../Widget/Custom_Hub.dart';
import '../Widget/Custom_Text_Filed.dart';
import '../Widget/Divider.dart';
import '../Widget/Snack_Bar.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  dynamic Email;
  dynamic Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
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
                        image:
                            DecorationImage(image: AssetImage('images/2.jpg')),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50, bottom: 50, left: 50, right: 50),
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
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(255, 250, 208, 20),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 50, bottom: 10, left: 10, right: 8),
                                child: Column(
                                  children: [
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
                                            size: 25,
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
                                padding: const EdgeInsets.only(top: 25),
                                child: C_Button(
                                  text: 'Login',
                                  On_Pressed: () async {
                                    setState(() {
                                      Custom_Hub(context);
                                    });

                                    if (Email == null || Password == null) {
                                      Snak_Bar(
                                          context, 'Enter Email and Password');
                                      ProgressHUD.of(context)?.dismiss();
                                    } else {
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: Email!,
                                                password: Password!);

                                        Snak_Bar(context, 'Successful ');

                                        Navigator.pushNamed(
                                            context, 'Key_Chat');
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          Snak_Bar(context, 'No user found.');
                                        } else if (e.code == 'wrong-password') {
                                          Snak_Bar(context, 'Wrong password.');
                                        }
                                      }
                                      setState(() {
                                        ProgressHUD.of(context)?.dismiss();
                                      });
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 28),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don\'t you have an account ?',
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
      ),
    );
  }
}

class Text_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Key_Register');
        },
        child: Text(
          'Register',
          style: TextStyle(fontSize: 17),
        ));
  }
}
