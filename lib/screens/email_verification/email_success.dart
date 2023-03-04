import 'dart:async';
import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/basic_info.dart';

class EmailSuccess extends StatefulWidget {
  @override
  _EmailSuccessState createState() => _EmailSuccessState();
}

class _EmailSuccessState extends State<EmailSuccess> {
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
        builder: (context) => BasicInfo(mobile_verified:true)
    )
    );
  }

  Widget build(BuildContext context) {
    // Figma Flutter Generator EmailSuccess - FRAME

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(children: <Widget>[
              Positioned(top: 350,
                left: 59,
                child:
                Container(
                    width: 735,
                    height: 735,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(57, 54, 115, 0.07999999821186066),
                      borderRadius:
                      BorderRadius.all(Radius.elliptical(500, 500)),
                    )),),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
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
                  )),
              Column(children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 138,
                    height: 138,
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/component.png'),
                          fit: BoxFit.fitWidth),
                    )),
                Text(
                  'Successfully \nVerified',
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
                Container(
                    width: 525,
                    height: 481,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/boy.png'),
                          fit: BoxFit.fitWidth),
                    )),
              ])
            ])));

  }
}
