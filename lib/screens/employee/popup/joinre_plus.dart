import 'package:flutter/material.dart';
import 'package:join_re/screens/main_page.dart';

class JoinRePlus extends StatefulWidget {

  final int id;
  final String color;
  final String template;

  const JoinRePlus({Key? key,  required this.id,required this.color,required this.template}) : super(key: key);
  @override
  _JoinRePlusState createState() => _JoinRePlusState();
}

enum SingingCharacter { resume1, resume2, resume3, resume4 }

class _JoinRePlusState extends State<JoinRePlus> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator JoinRePlus - FRAME
    return AlertDialog(
        content: Container(
            padding: const EdgeInsets.all(10),
            height: 270,
            child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'JOIN RE PLUS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(58, 54, 115, 1),
                            fontFamily: 'Open Sans',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1.25),
                      )),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Close.png'),
                                  fit: BoxFit.fitWidth),
                            ),
                          ))
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 170,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Standard',
                      style: TextStyle(
                          color: Color.fromRGBO(58, 54, 115, 1),
                          fontFamily: 'Open Sans',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1.25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(
                          color: Color.fromRGBO(58, 54, 115, 1),
                          fontFamily: 'Open Sans',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1.25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Premium',
                      style: TextStyle(
                          color: Color.fromRGBO(58, 54, 115, 1),
                          fontFamily: 'Open Sans',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1.25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage(pg: 5)),
                    );
                  },
                  child: Container(
                      width: 100,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ],
                        color: Color.fromRGBO(58, 54, 115, 1),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Buy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ))),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage(pg: 5)),
                    );
                  },
                  child: Container(
                      width: 100,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ],
                        color: Color.fromRGBO(170, 197, 1, 1),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Renewal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ))),
                ))
              ])
            ])));
  }
}
