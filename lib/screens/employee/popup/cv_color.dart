import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/cv_template.dart';

class CVColor extends StatefulWidget {
  final int id;
  const CVColor({Key? key,  required this.id,}) : super(key: key);
  @override
  _CVColorState createState() => _CVColorState();
}

// enum SingingCharacter { primary, secondary }

class _CVColorState extends State<CVColor> {
  var _character = "primary";

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CVColor - FRAME

    return AlertDialog(
        content: Container(
            padding: const EdgeInsets.all(5),
            height: 220,
            child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'CHOOSE COLORS',
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
                height: 40,
              ),
              InkWell(
                // borderRadius: BorderRadius.circular(15.0),
                  splashColor: Colors.black12,
                onTap: (){
                  _character = "primary";
                },
                  child:Row(
                children: [
                  Container(
                      width: 25.2265625,
                      height: 25.2265625,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(9, 4, 80, 1),
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(25.2265625, 25.2265625)),
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  const Text(
                    'Primary Color',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(58, 54, 115, 1),
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
            InkWell(
              // borderRadius: BorderRadius.circular(15.0),
                splashColor: Colors.black12,
            // GestureDetector(
                onTap: (){
                  _character = "secondary";
                },
                child:Row(children: [
                Container(
                    width: 25.2265625,
                    height: 25.2265625,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(170, 197, 1, 1),
                      borderRadius: BorderRadius.all(
                          Radius.elliptical(25.2265625, 25.2265625)),
                    )),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'Secondary Color',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(58, 54, 115, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ])),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                // borderRadius: BorderRadius.circular(15.0),
                splashColor: Colors.black12,
                onTap: () async {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CVTemplate(id:widget.id,color:_character);
                      });
                },
                child: Container(
                    width: 113,
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
                          'Next',
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
              )
            ])));
  }
}
