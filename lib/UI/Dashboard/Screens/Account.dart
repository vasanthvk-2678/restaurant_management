import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final profileState = GlobalKey<_AccountState>();
  bool profileCompleted = false;
  String mobileNumber;

  void onTap() {
    Get.toNamed(
      '/profileComplete',
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * .4,
        child: Column(
          children: [
            Stack(
              children: [
                new Container(
                    width: size.width,
                    height: size.height * .4 - 50,
                    child: Image.asset(
                      'images/cover.jpg',
                      width: size.width,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 120,
                      height: 120,
                      // color: Colors.white,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/user.png',
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    width: 100,
                                    color: Colors.blue,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery
                                                .of(context)
                                                .viewInsets
                                                .bottom),
                                        child: TextField()));
                              });
                        },
                      text: 'Mobile number',
                      style: DefaultTextStyle.of(context).style),
                  softWrap: true),
            )
          ],
        ),
      ),
    );
  }
}