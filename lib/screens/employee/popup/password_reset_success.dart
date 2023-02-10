import 'dart:async';
import 'package:flutter/material.dart';
import 'package:join_re/screens/company/employer_login.dart';

class  PasswordResetSuccess extends StatefulWidget {
  @override
  _PasswordResetSuccessState createState() => _PasswordResetSuccessState();
}

class _PasswordResetSuccessState extends State<PasswordResetSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => EmployerLogin()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PasswordResetSuccess - FRAME
    return AlertDialog(
        content: SizedBox(
          height: 250,
          child: Column(
              children: [
                Row(
                    children: [
                      const SizedBox(
                        width:
                        200,
                      ),
                      GestureDetector(
                          onTap:
                              () {
                            Navigator.of(context).pop();
                          },
                          child:
                          Container(
                            alignment: Alignment.centerRight,
                            width: 14,
                            height: 17.6875,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/Close.png'), fit: BoxFit.fitWidth),
                            ),
                          ))
                    ]),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width:
                    130,
                    height:
                    130,
                    padding: const EdgeInsets
                        .all(
                        30.0),
                    decoration:
                    const BoxDecoration(
                      image: DecorationImage(
                          image:
                          AssetImage('assets/images/component.png'),
                          fit: BoxFit.fitWidth),
                    )),
                const Text(
                  ' Successfully\n Password Changed',
                  textAlign:
                  TextAlign
                      .center,
                  style: TextStyle(
                      color: Color.fromRGBO(
                          58,
                          54,
                          115,
                          1),
                      fontFamily:
                      'Open Sans',
                      fontSize:
                      16,
                      letterSpacing:
                      1 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight:
                      FontWeight
                          .bold,
                      height:
                      1),
                )
              ]),
        ));
  }
}
