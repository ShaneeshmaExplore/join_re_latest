import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/company/company_profile.dart';
import 'package:join_re/screens/email_verification/verify_email.dart';

import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/mobile_verification/verify_mobile.dart';

class BasicInfoEmployer extends StatefulWidget {
  const BasicInfoEmployer({super.key});

  @override
  _BasicInfoEmployerState createState() => _BasicInfoEmployerState();
}

var captcha = TextEditingController();

TextEditingController business_name = TextEditingController();
TextEditingController mobile = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController contact_person = TextEditingController();
class _BasicInfoEmployerState extends State<BasicInfoEmployer>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  var captcha = TextEditingController();
  var password = TextEditingController();

  String code = "";
  bool _isLoading = false;

  void _register_employer()async{
    setState(() {
      _isLoading = true;
    });
    ;
    var id;
    var data = {
      "api":true,
      "name" : business_name.text,
      "type" : "Provider",
      "mobile" : mobile.text,
      "email" : email.text,
      "password" : password.text,
      "contact_person" : contact_person.text,

    };
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => CompanyProfile(data:data)
        ),
      );


    setState(() {
      _isLoading = false;
    });
  }

  Future<void> incrementCounter(BuildContext context) async {
    setState(() {
      code = "";
      for (var i = 0; i < 6; i++) {
        code = code + Random().nextInt(9).toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    captcha.text = getRandomString(5);
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          // bottomNavigationBar: EmployeeRegFooter(),
          // body: SingleChildScrollView(
          body: Center(
              child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0) {
                      // Swiping in right direction.
                      Navigator.pushNamed(context, '/select_option');
                    }

                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      Navigator.pushNamed(context, '/company_profile');
                    }
                  },
                  child: Column(children: [
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Stack(children: [
                                Container(
                                  // height: MediaQuery.of(context).size.height,
                                  constraints: BoxConstraints(
                                      minHeight:
                                      MediaQuery.of(context).size.height - 90,
                                      maxHeight: double.infinity),
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.fromLTRB(
                                      30, 0, 30, 0),                                  // padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(58, 54, 115, 1),
                                      width: 1.5,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 50, 50, 0),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Basic Information",
                                                  style: TextStyle(
                                                      color: Color(0xff3A3673),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 20)),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter Business name';
                                                  }
                                                  return null;
                                                },
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff3A3673),
                                                    fontFamily: 'Open Sans'),
                                                controller: business_name,
                                                decoration: InputDecoration(
                                                  // border: Outline(),
                                                  labelText: 'Business Name',
                                                ),
                                              ),
                                              Stack(children: <Widget>[
                                                TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Email';
                                                    }
                                                    return null;
                                                  },
                                                  controller: email,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff3A3673),
                                                      fontFamily: 'Open Sans'),
                                                  decoration: InputDecoration(
                                                    // border: Outline(),
                                                    labelText: 'Email',
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 30,
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.015,
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          // Navigator.pushNamed(
                                                          //     context,
                                                          //     "/verify_email",
                                                          //     arguments:
                                                          //         "employer");
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => VerifyEmail(email:email.text)),
                                                          );
                                                        },
                                                        child: Text(
                                                          'Verify',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      58,
                                                                      54,
                                                                      115,
                                                                      1),
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 12,
                                                              letterSpacing:
                                                                  0.1 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              height: 0.5),
                                                        )))
                                              ]),
                                              Stack(children: <Widget>[
                                                TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Mobile';
                                                    }
                                                    return null;
                                                  },
                                                  controller: mobile,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff3A3673),
                                                      fontFamily: 'Open Sans'),
                                                  decoration: InputDecoration(
                                                    // border: Outline(),
                                                    labelText: 'Mobile No',
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 30,
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.015,
                                                    child: GestureDetector(
                                                        onTap: () {

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => VerifyMobile(phoneNumber:mobile.text)),
                                                          );
                                                          // Navigator.pushNamed(
                                                          //     context,
                                                          //     "/verify_mobile",
                                                          //     arguments:
                                                          //         "employer");
                                                        },
                                                        child: Text(
                                                          'Verify',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      58,
                                                                      54,
                                                                      115,
                                                                      1),
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 12,
                                                              letterSpacing:
                                                                  0.1 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              height: 0.5),
                                                        )))
                                              ]),
                                              TextFormField(
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff3A3673),
                                                    fontFamily: 'Open Sans'),
                                                controller: contact_person,
                                                decoration: InputDecoration(
                                                  // border: Outline(),
                                                  labelText: 'Contact Person',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child:
                                                                TextFormField(
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Captcha required';
                                                                }
                                                                if (value !=
                                                                    captcha
                                                                        .text) {
                                                                  return 'Captcha mismatch!!';
                                                                }
                                                                return null;
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                ),
                                                              ),
                                                              initialValue:
                                                                  null,
                                                              style: TextStyle(
                                                                  letterSpacing:
                                                                      5.0,
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff3A3673),
                                                                  fontFamily:
                                                                      'Open Sans'),
                                                            ))),
                                                    Expanded(
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    2,
                                                                    2,
                                                                    2),
                                                            child:
                                                                TextFormField(
                                                              readOnly: true,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              decoration:
                                                                  InputDecoration(
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromRGBO(
                                                                        58,
                                                                        54,
                                                                        115,
                                                                        1),
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                ),
                                                              ),
                                                              controller:
                                                                  captcha,
                                                              style: TextStyle(
                                                                  letterSpacing:
                                                                      5.0,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Open Sans'),
                                                            ))),
                                                    // Expanded(
                                                    // child:
                                                    InkWell(
                                                      child:
                                                          Icon(Icons.refresh),
                                                      onTap: () async {
                                                        captcha.text = '';
                                                        // Below line stops keyboard from appearing
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                new FocusNode());
                                                        // Show Date Picker Here
                                                        // await incrementCounter(context);
                                                        captcha.text =
                                                            getRandomString(5);
                                                      },
                                                    )
                                                  ]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Password required';
                                                  }
                                                  return null;
                                                },
                                                onChanged: ((value) {
                                                }),
                                                obscureText: true,
                                                controller: password,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff3A3673),
                                                    fontFamily: 'Open Sans'),
                                                decoration: InputDecoration(
                                                  labelText: 'Password',
                                                ),
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Re enter password';
                                                  }
                                                  if (value != password.text) {
                                                    return 'Password mismatch!!';
                                                  }
                                                  return null;
                                                },
                                                onChanged: ((value) {
                                                }),
                                                obscureText: true,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff3A3673),
                                                    fontFamily: 'Open Sans'),
                                                decoration: InputDecoration(
                                                  labelText: 'Confirm Password',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 35,
                                              ),
                                              Image.asset(
                                                'assets/images/business_woman.png',
                                                height: 140,
                                              ),
                                            ]))),
                                Positioned(
                                  top: 510,
                                  left: 30,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            57, 54, 115, 0.07999999821186066),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(237.75, 237.75)),
                                      )),
                                )
                              ]);
                            })),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        // height: 14,
                        child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(width: 13.596155166625977, height: 14),
                      )),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Container(
                            width: 13.596155166625977,
                            height: 14,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(13.596155166625977, 14)),
                            )),
                      )),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                            onTap: () {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _register_employer();

    }
                              // Swiping in right direction.
                              // Navigator.pushNamed(context, '/company_profile');
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
                        width: 20,
                      ),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _register_employer();

                              }                                   // Navigator.pushNamed(context, "/company_profile");
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
                      const SizedBox(
                        width: 30,
                      ),
                    ])),
                  ])))),
    );
  }
}
