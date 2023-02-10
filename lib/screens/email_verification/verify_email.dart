import 'package:flutter/material.dart';
import 'dart:math' as math;

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // bottomNavigationBar: EmployeeRegFooter(),
        // body: SingleChildScrollView(
        body:SingleChildScrollView(child: Center(
            child: GestureDetector(
                onPanUpdate: (details) {
                  // Swiping in right direction.
                  // if (details.delta.dx > 0) {
                  //   Navigator.pushNamed(context, '/select_option');
                  // }

                  // // Swiping in left direction.
                  // if (details.delta.dx < 0) {
                  //   Navigator.pushNamed(context, '/education');
                  // }
                },
                child: SingleChildScrollView(
                    child: Column(children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height-60,
                      // height: 680,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(58, 54, 115, 1),
                          width: 2,
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
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 100,),
                                  Text("Verify Your Email",
                                      style: TextStyle(
                                          color: Color(0xff3A3673),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20)),

                                  Container(
                                      alignment: Alignment.center,
                                      width: 300,
                                      height: 300,
                                      child: Stack(children: [
                                        Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/lap.png'),
                                                    fit: BoxFit.fitWidth)),
                                            alignment: Alignment
                                                .center, // where to position the child
                                            child:
                                              Container(
                                                width: 150,
                                                height: 90,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 50),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 50),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/5511messagesent1.png'),
                                                        fit:
                                                            BoxFit.fitWidth))),
                                            ),
                                      ])),
                                  TextFormField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      prefixIcon :Container(
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Color(0xff3A3673), width: 1,)),
                                        ),
                                        child: const Image(
                                          image: AssetImage('assets/images/Emailverification.png'),
                                          width: 10,
                                          height: 10,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      enabledBorder:  OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Color(0xff3A3673), width: 1,),
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      border: const OutlineInputBorder(),
                                    ),
                                    initialValue: null,
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 14,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      width: 400,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              backgroundColor: Color.fromRGBO(
                                                  58, 54, 115, 1)),
                                          onPressed: () {
                                            // if (formGlobalKey.currentState.validate()) {
                                            //   formGlobalKey.currentState.save();
                                            //   // use the email provided here
                                            // }
                                            Navigator.pushNamed(
                                                context, "/email_confirmation");
                                          },
                                          child: Text("Request For OTP")))
                                ]))),
                  ])
                ]))))));
  }
}
