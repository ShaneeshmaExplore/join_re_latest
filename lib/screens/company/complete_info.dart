import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:join_re/screens/employee/basic_info.dart';

class CompleteInfo extends StatefulWidget {
  const CompleteInfo({super.key});

  @override
  _CompleteInfoState createState() => _CompleteInfoState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
const List<String> company_list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownValue = list.first;
String company_list_dropdownValue = company_list.first;

class _CompleteInfoState extends State<CompleteInfo> with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();

  var captcha = TextEditingController();

  String code = "";

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
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // bottomNavigationBar: EmployeeRegFooter(),
      // body: SingleChildScrollView(
      body: Center(
          child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {
                  Navigator.pushReplacementNamed(context, '/company_profile');
                }
              },
              child: SingleChildScrollView(
                  child: Column(children: [
                Stack(children: [
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    height: 1210,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(30.0),
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
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text("Basic Information",
                                style: TextStyle(
                                    color: Color(0xff3A3673),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
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
                                            Navigator.pushNamed(
                                                context,
                                                "/verify_email",
                                                arguments:
                                                "employer");
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
                                            Navigator.pushNamed(
                                                context,
                                                "/verify_mobile",
                                                arguments:
                                                "employer");
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
                              decoration: InputDecoration(
                                // border: Outline(),
                                labelText: 'Contact Person',
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            textAlign: TextAlign.left,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                            initialValue: null,
                                            style: TextStyle(
                                                letterSpacing: 5.0,
                                                fontSize: 12,
                                                color: Color(0xff3A3673),
                                                fontFamily: 'Open Sans'),
                                          ))),
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 2, 2, 2),
                                          child: TextFormField(
                                            readOnly: true,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color.fromRGBO(
                                                  58, 54, 115, 1),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                            controller: captcha,
                                            // initialValue: 'asf5dd',
                                            style: TextStyle(
                                                letterSpacing: 5.0,
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontFamily: 'Open Sans'),
                                          ))),
                                  // Expanded(
                                  // child:
                                  InkWell(
                                    child: Icon(Icons.refresh),
                                    onTap: () async {
                                      captcha.text = '';
                                      // Below line stops keyboard from appearing
                                      FocusScope.of(context)
                                          .requestFocus(
                                          new FocusNode());
                                      // Show Date Picker Here
                                      // await incrementCounter(context);
                                      captcha.text = getRandomString(5);
                                    },
                                  )
                                ]),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              onChanged: ((value) {
                                print(value);
                              }),
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            TextFormField(
                              onChanged: ((value) {
                                print(value);
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
                              height: 30,
                            ),
                            Text("Company Profile",
                                style: TextStyle(
                                    color: Color(0xff3A3673),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                            SizedBox(
                              height: 25,
                            ),
                            Column(mainAxisSize: MainAxisSize.min, children: [
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff3A3673),
                                    fontFamily: 'Open Sans'),
                                decoration: InputDecoration(
                                  // border: Outline(),
                                  labelText: 'Tagline of the Company',
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff3A3673),
                                    fontFamily: 'Open Sans'),
                                decoration: InputDecoration(
                                  // border: Outline(),
                                  labelText: 'Company Website',
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff3A3673),
                                    fontFamily: 'Open Sans'),
                                decoration: InputDecoration(
                                  // border: Outline(),
                                  labelText: 'Industry Name',
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff3A3673),
                                    fontFamily: 'Open Sans'),
                                decoration: InputDecoration(
                                  // border: Outline(),
                                  labelText: 'Company Mail',
                                ),
                              ),
                            ]),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Company Type',
                              ),
                              value: company_list_dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              elevation: 0,
                              style: const TextStyle(
                                color: Color(0xff3A3673),
                                fontSize: 10,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  company_list_dropdownValue = value!;
                                });
                              },
                              items: company_list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: InputDecoration(
                                // border: Outline(),
                                labelText: 'Description of the Company',
                              ),
                            ),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: InputDecoration(
                                // border: Outline(),
                                labelText: 'Headquarters of the Company',
                              ),
                            ),
                            TextFormField(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: InputDecoration(
                                // border: Outline(),
                                labelText: 'Address of the Company',
                              ),
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 10.0, 0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff3A3673),
                                            fontFamily: 'Open Sans'),
                                        decoration: InputDecoration(
                                          labelText: 'Postal Code',
                                        )),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0.0, 0),
                                    child: TextFormField(
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff3A3673),
                                            fontFamily: 'Open Sans'),
                                        decoration: InputDecoration(
                                          labelText: 'City',
                                        )),
                                  )),
                                ]),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Country',
                              ),
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              elevation: 0,
                              style: const TextStyle(
                                color: Color(0xff3A3673),
                                fontSize: 10,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                                width: 400,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(58, 54, 115, 1)),
                                    onPressed: () {
                                      // if (formGlobalKey.currentState.validate()) {
                                      //   formGlobalKey.currentState.save();
                                      //   // use the email provided here
                                      // }
                                      Navigator.pushReplacementNamed(
                                          context, "/employer_home");
                                    },
                                    child: Text("Submit")))
                          ]))),
                  Positioned(
                      top: 450,
                      left: -200,
                      child: Container(
                          width: 735.9408569335938,
                          height: 735.9408569335938,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                57, 54, 115, 0.07999999821186066),
                            borderRadius: BorderRadius.all(Radius.elliptical(
                                735.9408569335938, 735.9408569335938)),
                          )))
                ]),
              ])))),
    );
  }
}
