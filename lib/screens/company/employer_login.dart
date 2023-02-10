import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:join_re/screens/main_page_employer.dart';
import 'dart:math' as math;
import 'package:join_re/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerLogin extends StatefulWidget {
  @override
  _EmployerLoginState createState() => _EmployerLoginState();
}

_showMsg(msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );
  // _scaffoldKey.currentState.showSnackBar(snackBar);
}
class _EmployerLoginState extends State<EmployerLogin> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  var email;
  var password;
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EmployerLogin - FRAME

    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            // appBar: Header(),
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 760,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(children: [
                    Container(
                        width: 450,
                        height: 350,
                        margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/home_page.png'),
                              fit: BoxFit.fitWidth),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 360,
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(58, 54, 115, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(children: [
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                fontFamily: 'Open Sans',
                                fontSize: 24,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                email = value;

                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: InputDecoration(
                                // border: Outline(),
                                labelText: 'Email',
                              )),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              password = value;

                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3A3673),
                                fontFamily: 'Open Sans'),
                            decoration: InputDecoration(
                              // border: Outline(),
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(height: 32),
                          InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Processing Data')),
                                  );
                                  _prov_login();
                                }
                                // else
                                //   Navigator.pushNamed(
                                //       context, '/employer_home');
                              },
                              child: Container(
                                  width: 259,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: Offset(0, 4),
                                          blurRadius: 4)
                                    ],
                                    color: Color.fromRGBO(58, 54, 115, 1),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Processing Data')),
                                          );
                                          _prov_login();
                                        }
                                        // else
                                        //   Navigator.pushNamed(
                                        //       context, '/employer_home');
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.all(
                                              12), //apply padding to all four sides
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                backgroundColor: Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ))))),
                          SizedBox(height: 30),
                          Row(children: [
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/basic_info_employer');
                                    },
                                    child: Text(
                                      'Sign up',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))),
                            Expanded(
                                child: Text(
                              'Forgot Password',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color.fromRGBO(58, 54, 115, 1),
                                  fontFamily: 'Open Sans',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ))
                          ])
                        ]))
                  ])),
            )));
  }

  void _prov_login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      "type" : "Provider",
      "email" : email,
      "password" : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));

      List<dynamic> items = [body['user'],body['id']];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MainPageEmployer(pg:0,login:items,
          ),),);
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });

  }
}


