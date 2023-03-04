import 'dart:math';

import 'package:flutter/material.dart';

import 'package:join_re/screens/employee/basic_info_widget.dart';
import 'package:join_re/screens/employee/education.dart';

class BasicInfo extends StatefulWidget {
  final mobile_verified;
  final email_verified;
  const BasicInfo({super.key,this.mobile_verified,this.email_verified});

  @override
  _BasicInfoState createState() => _BasicInfoState();
}

enum Gender { Male, Female }

Gender? _gender = Gender.Female;

DateTime selectedDate = DateTime.now();

var name = TextEditingController();
var email = TextEditingController();
var dob = TextEditingController();
var mobile = TextEditingController();
var captcha = TextEditingController();
var password = TextEditingController();
var gender = TextEditingController();
var arrData;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class _BasicInfoState extends State<BasicInfo> with InputValidationMixin {
  @override
  void initState() {
    super.initState();
    captcha.text = getRandomString(5);
    // password.text = widget.data['password'];
  }

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // String code = getRandomString(5);
    List<Widget> _cardList = [BasicInfoWidget()];

    void _next_education() {
      var data = {
        "api": true,
        "name": name.text,
        "type": "Seeker",
        "gender": gender.text,
        "dob": dob.text,
        "mobile": mobile.text,
        "email": email.text,
        "password": password.text,
        "status": "Active",
        "mobile_verified":widget.mobile_verified,
        "email_verified":widget.email_verified,
      };
      print("**************************");
      print(name.text);
      print("**************************");

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Education(data: data)));
    }

    return Form(
        key: formGlobalKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          // bottomNavigationBar: EmployeeRegFooter(),
          // body: SingleChildScrollView(
          body: Center(
              child: GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0) {
                      Navigator.pushNamed(context, '/select_option');
                    }

                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      Navigator.pushNamed(context, '/education');
                    }
                  },
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Stack(children: [
                          Positioned(
                            top: 480,
                            left: 30,
                            child: Container(
                                alignment: Alignment.topLeft,
                                width: 230,
                                height: 230,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      57, 54, 115, 0.07999999821186066),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(237.75, 237.75)),
                                )),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 120,
                                maxHeight: double.infinity),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            // padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Basic Information",
                                              style: TextStyle(
                                                  color: Color(0xff3A3673),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 20)),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _cardList.length,
                                              itemBuilder: (context, index) {
                                                return _cardList[index];
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/Smiling_Boy.png',
                                            height: 200,
                                          ),
                                        ]))),
                          ),

                        ]),
                        Container(
                            // width: 101.00029754638672,
                            // height: 14,
                            child: Row(children: <Widget>[
                          SizedBox(
                            width: 60,
                          ),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                                width: 13.596155166625977, height: 14),
                          )),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                                width: 13.596155166625977,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(58, 54, 115, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(
                                          13.596155166625977, 14)),
                                )),
                          )),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: GestureDetector(
                                onTap: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();

                                    _next_education();
                                    // Swiping in right direction.
                                    // Navigator.pushNamed(context, '/education');
                                  }
                                },
                                child: Container(
                                    width: 13.596155166625977,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(
                                              13.596155166625977, 14)),
                                    ))),
                          )),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: GestureDetector(
                                onTap: () {
                                  // Swiping in right direction.
                                  Navigator.pushNamed(context, '/work_exp');
                                },
                                child: Container(
                                    width: 13.596155166625977,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(
                                              13.596155166625977, 14)),
                                    ))),
                          )),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: GestureDetector(
                                onTap: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                    _next_education();
                                    // Navigator.pushNamed(context, "/education");
                                  }
                                },
                                child: Text('Next',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1))),
                          )),
                          SizedBox(
                            width: 30,
                          )
                        ])),
                      ])))),
        ));
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    RegExp regex = new RegExp(
        '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))');
    return regex.hasMatch(email);
  }
}
