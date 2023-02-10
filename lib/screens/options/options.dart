import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Options - FRAME

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(
                  alignment: Alignment.center,
                    children: <Widget>[
                      // Expanded(child:
                  Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/group.png'),
                                fit: BoxFit.fill),
                          )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/employer_login');
                        },
                        child: Container(
                            width: 250,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/mobilep.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                      Expanded(
                          child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                       Text("join be an",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0.1)),
                          Text("employer",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.1))
                        ],)),
                          Image.asset(
                            'assets/images/double_left.png',
                          )
                        ],)
                        )),
                    SizedBox(height: 30,),
                      Material(
                          color: Colors.transparent,
                          child:InkWell(splashColor:
                      Color.fromRGBO(126, 119, 219, 1.0),

                          onTap: () {
                            Navigator.pushNamed(context, '/employee_login');
                          },
                          child: Container(
                              width: 250,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:
                                    AssetImage('assets/images/mobilep.png'),
                                    fit: BoxFit.fitWidth),
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                      child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Text("join be an",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.normal,
                                                  letterSpacing: 0.1)),
                                          Text("employee",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.1))
                                        ],)),
                                  Image.asset(
                                    'assets/images/double_left.png',
                                  )
                                ],)
                          ))),


                  ],)
                            ]))));


  }
}
