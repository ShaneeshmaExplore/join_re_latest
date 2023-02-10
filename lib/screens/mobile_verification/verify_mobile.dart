import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyMobile extends StatefulWidget {
  final phoneNumber;
  const VerifyMobile({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _VerifyMobileState createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  @override
  Widget build(BuildContext context) {
    String phoneNumber, verificationId;
    String otp, authStatus = "";
    int forceCodeResent;
    FirebaseAuth auth = FirebaseAuth.instance;
    otpDialogBox(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text('Enter your OTP'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    otp = value;
                  },
                ),
              ),
              contentPadding: EdgeInsets.all(10.0),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // signIn(otp);
                  },
                  child: Text(
                    'Submit',
                  ),
                ),
              ],
            );
          });
    }

    Future<void> verifyPhoneNumber(BuildContext context) async {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(seconds: 15),
        verificationCompleted: (AuthCredential authCredential) {
          setState(() {
            authStatus = "Your account is successfully verified";
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          setState(() {
            authStatus = "Authentication failed";
          });
        },
        codeSent: (String verId, [ forceCodeResent]) {
          verificationId = verId;
          setState(() {
            authStatus = "OTP has been successfully send";
          });
          otpDialogBox(context).then((value) {});
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
          setState(() {
            authStatus = "TIMEOUT";
          });
        },
      );
    }
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // bottomNavigationBar: EmployeeRegFooter(),
        // body: SingleChildScrollView(
        body: Center(
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
                        margin: const EdgeInsets.all(30.0),
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.all(30),


                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text("Verify Your Number",
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Rectangle.png'),
                                                    fit: BoxFit.fitHeight)),
                                            alignment: Alignment
                                                .center, // where to position the child
                                            child: Column(children:[
                                              SizedBox(height:120),Container(
                                              alignment: Alignment.bottomCenter,
                                                width: 100,
                                                height: 110,
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
                                                            BoxFit.fitWidth)))])),
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
                                        padding: EdgeInsets.all(10),
                                        child: Text('+91',textAlign:TextAlign.center,style: TextStyle(
                                            letterSpacing: 1.0,
                                            fontSize: 20,
                                            color: Color(0xff3A3673),
                                            fontFamily: 'Open Sans'),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      enabledBorder:  OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Color(0xff3A3673), width: 1,),
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      border: const OutlineInputBorder(),

                                      // border: OutlineInputBorder(
                                      //   borderSide: const BorderSide(color: Color(0xff3A3673), width: 0.1),
                                      // ),
                                    ),
                                    initialValue: null,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                    ],
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 20,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      width: 400,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              backgroundColor: Color.fromRGBO(
                                                  58, 54, 115, 1)),
                                          onPressed: () {
                                            verifyPhoneNumber(context);
                                            // Navigator.pushNamed(
                                            //     context, "/verification");
                                          },
                                          child: Text("Request For OTP")))
                                ]))),
                  ])
                ])))));
  }
}
