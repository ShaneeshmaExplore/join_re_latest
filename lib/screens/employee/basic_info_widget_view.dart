import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/preview_page.dart';

class BasicInfoWidgetView extends StatefulWidget {
  final data;
  const BasicInfoWidgetView({Key? key, this.data}) : super(key: key);

  @override
  State<BasicInfoWidgetView> createState() => _BasicInfoWidgetViewState();
}

class _BasicInfoWidgetViewState extends State<BasicInfoWidgetView> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime now = new DateTime.now();
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1, 1),
        lastDate: selectedDate);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final formGlobalKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    captcha.text = getRandomString(5);
    // password.text = widget.data['password'];
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Column(children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Name';
              }

              return null;
            },
            controller: name,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Name',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
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
          TextFormField(
            controller: mobile,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Mobile';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Mobile No',
            ),
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                  child: TextFormField(
                      controller: gender,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3A3673),
                          fontFamily: 'Open Sans'),
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      )),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextFormField(
                      controller: dob,
                      onTap: () async {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        await _selectDate(context);
                        dob.text =
                            DateFormat('yyyy/MM/dd').format(selectedDate);
                      },
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff3A3673),
                          fontFamily: 'Open Sans'),
                      decoration: InputDecoration(
                        // border: Outline(),
                        labelText: 'DOB',
                      )),
                )),
                GestureDetector(
                    onTap: () async {
                      // Below line stops keyboard from appearing
                      FocusScope.of(context).requestFocus(new FocusNode());
                      // Show Date Picker Here
                      await _selectDate(context);
                      dob.text = DateFormat('yyyy/MM/dd').format(selectedDate);
                    },
                    child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Calendar.png'),
                              fit: BoxFit.fitWidth),
                        )))
              ]),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password required';
              }
              return null;
            },
            controller: password,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Re enter password';
              }
              if (value != password.text) {
                return 'Password mismatch!!';
              }
              return null;
            },
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
            height: 40,
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Captcha required';
                            }
                            if (value != captcha.text) {
                              return 'Captcha mismatch!!';
                            }
                            return null;
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          style: TextStyle(
                              letterSpacing: 5.0,
                              fontSize: 12,
                              color: Color(0xff3A3673),
                              fontFamily: 'Open Sans'),
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
                        child: TextFormField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(58, 54, 115, 1),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          controller: captcha,
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Show Date Picker Here
                    // await incrementCounter(context);
                    captcha.text = getRandomString(5);
                  },
                )
              ]),
        ]));
  }
}
