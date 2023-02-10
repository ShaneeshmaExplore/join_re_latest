
import 'dart:async';
import 'package:flutter/material.dart';

class ProfileUpdatedEmployer extends StatefulWidget {
  @override
  _ProfileUpdatedEmployerState createState() => _ProfileUpdatedEmployerState();
}

class _ProfileUpdatedEmployerState extends State<ProfileUpdatedEmployer> {
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
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => Options()
    //   )
    // );
    Navigator.pushReplacementNamed(context, '/preview_employer');
  }

  Widget build(BuildContext context) {
    // Figma Flutter Generator ConfirmetionpageWidget - FRAME

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(

                alignment: Alignment.center,
                children: <Widget>[
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                  height: 80,
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
                  ' Profile Updated',
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
                      height: 100,
                    ),
                Container(
                    width: 256,
                    height: 256,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_updated.png'),
                          fit: BoxFit.fitWidth),
                    )),
              ])
            ])));
  }
}
