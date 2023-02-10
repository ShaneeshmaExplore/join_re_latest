import 'dart:async';

import 'package:flutter/material.dart';

class LogoFirst extends StatefulWidget {
  @override
  State<LogoFirst> createState() => _LogoFirstState();
}

class _LogoFirstState extends State<LogoFirst> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => Options()
    //   )
    // );
    Navigator.pushNamed(context, '/select_option');
  }

  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoFirst - FRAME



    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 250, 250),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/select_option');
            },
            child:Column(children: [
              // SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                  width: 450,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/home_page.png'),
                        fit: BoxFit.fitWidth),
                  )),
              SizedBox(height: 90,),

              Container(
                  width: 220,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/joinre.png'),
                        fit: BoxFit.fitWidth),
                  )),
SizedBox(height: 30,),
              Material(
                  child: Text(
                    'Loading.....',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontFamily: 'Inter',
                        fontSize: 15,
                        letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ))

            ],)
        )

    );


  }
}
