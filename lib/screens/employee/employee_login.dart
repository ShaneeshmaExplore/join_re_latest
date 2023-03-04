import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/education.dart';
import 'package:join_re/screens/employee/employee_home.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:join_re/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeLogin extends StatefulWidget {
  const EmployeeLogin({super.key});

  @override
  State<EmployeeLogin> createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {
  final _formKey = GlobalKey<FormState>();
 bool _isLoading = false;
  var email;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showMsg(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid Credentials'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EmployeeLogin - FRAME

    return Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            // appBar: Header(),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        width: 430,
                        height: 340,
                        margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        decoration: const BoxDecoration(
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
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(58, 54, 115, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          const Text(
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
                          const SizedBox(
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
                              
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff3A3673),
                                  fontFamily: 'Open Sans'),
                              decoration: const InputDecoration(
                                // border: Outline(),
                                labelText: 'Email',
                                errorStyle: TextStyle(height: 0), //
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
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff3A3673),
                                fontFamily: 'Open Sans'),
                            decoration: const InputDecoration(
                              // border: Outline(),
                              labelText: 'Password',
                              errorStyle: TextStyle(height: 0), //
                            ),
                          ),
                          const SizedBox(height: 32),
                          Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  // borderRadius: BorderRadius.circular(15.0),
                                  splashColor: Colors.black12,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                       ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Processing Data')),
                                              );
                                       _login();

                                    } else {

                                              // Navigator.pushNamed(
                                              //     context, '/employee_home');
                                            }
                                  },
                                  child: Container(
                                      width: 259,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Processing Data')),
                                              );
                                              _login();

                                            } else {

                                              // Navigator.pushNamed(
                                              //     context, '/employee_home');
                                            }
                                          },
                                          child: const Padding(
                                              padding: EdgeInsets.all(
                                                  12), //apply padding to all four sides
                                              child: Text(
                                                'Login',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              )))))),
                          const SizedBox(height: 30),
                          Row(children: [
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/basic_info_employee');

                                    },
                                    child: const Text(
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
                            const Expanded(
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
                  ]),
                ))));
  }

void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      "type" : "Seeker",
      "email" : email,
      "password" : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      // Scaffold.of(context).hideCurrentSnackBar();

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));

      List<dynamic> items = [body['user'],body['id'],body['details']];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MainPage(pg:0,login:items,package_id: '',
          ),),);
    }else{
      _showMsg(context);
    }

    setState(() {
      _isLoading = false;
    });

  }
}

