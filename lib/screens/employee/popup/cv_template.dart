import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/joinre_plus.dart';

class CVTemplate extends StatefulWidget {
  @override
  _CVTemplateState createState() => _CVTemplateState();
}

enum SingingCharacter { resume1, resume2, resume3, resume4 }

class _CVTemplateState extends State<CVTemplate> {
  SingingCharacter? _character = SingingCharacter.resume1;

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CVTemplate - FRAME

    return AlertDialog(
        content: Container(
            padding: const EdgeInsets.all(5),
            height: 260,
            child: Column(children: <Widget>[
              Container(
                  alignment:
                  Alignment.centerRight,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                            'SELECT',
                            textAlign:
                            TextAlign.center,
                            style: TextStyle(
                                color: Color
                                    .fromRGBO(58,
                                    54, 115, 1),
                                fontFamily:
                                'Open Sans',
                                fontSize: 14,
                                letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight:
                                FontWeight
                                    .bold,
                                height: 1.25),
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(
                                context)
                                .pop();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration:
                            const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Close.png'),
                                  fit: BoxFit
                                      .fitWidth),
                            ),
                          ))
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child:Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Resume2.png'),
                                fit: BoxFit.fill),
                          ))),
                  const SizedBox(
                    width: 40,
                  ),

                  Expanded(
                      child:Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Resume1.png'),
                                fit: BoxFit.fill),
                          ))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Expanded(child:
                Container(
                    width: 70,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Resume5.png'),
                          fit: BoxFit.fill),
                    ))),
                const SizedBox(
                  width: 40,
                ),

                Expanded(child:
                Container(
                    width: 70,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Resume4.png'),
                          fit: BoxFit.fill),
                    ))),
              ]),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext
                      context) {
                        return JoinRePlus();
                      });
                },
                child: Container(
                    width: 113,
                    height: 30,
                    decoration:
                    const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(
                        topLeft:
                        Radius.circular(
                            5),
                        topRight:
                        Radius.circular(
                            5),
                        bottomLeft:
                        Radius.circular(
                            5),
                        bottomRight:
                        Radius.circular(
                            5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color
                                .fromRGBO(
                                0,
                                0,
                                0,
                                0.25),
                            offset:
                            Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(
                          58, 54, 115, 1),
                    ),
                    child: const Padding(
                        padding:
                        EdgeInsets.all(7),
                        child: Text(
                          'Next',
                          textAlign: TextAlign
                              .center,
                          style: TextStyle(
                              color: Color
                                  .fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1),
                              fontFamily:
                              'Roboto',
                              fontSize: 16,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight:
                              FontWeight
                                  .normal,
                              height: 1),
                        ))),
              )
            ])));
  }
}
