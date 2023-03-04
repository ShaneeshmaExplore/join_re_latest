import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/joinre_plus.dart';
import 'package:join_re/screens/pdf/app.dart';
import 'package:join_re/utils/api.dart';

class CVTemplate extends StatefulWidget {

  final int id;
  final String color;

  const CVTemplate({Key? key,  required this.id,required this.color,}) : super(key: key);
  @override
  _CVTemplateState createState() => _CVTemplateState();
}

// enum SingingCharacter { resume1, resume2, resume3, resume4 }

class _CVTemplateState extends State<CVTemplate> {
var payment_status;
  @override
  void initState() {
    super.initState();
    checkPayment();
  }
  var _character = "resume1";

  checkPayment() async {
    var item = await checkPaymentStatus();
    if (item != null) {
      setState(() {
        payment_status = item;
      });
    }
  }

  Future checkPaymentStatus() async {
    var data = {
      "id": widget.id,
    };
    var res = await Network().authData(data, '/check_payment_status');
    var payment_sts;
    if(res.statusCode == 200){
      payment_sts =json.decode(res.body);
      payment_sts =payment_sts['user'];
    }
    else{
      payment_sts = 0;
    }
    print("---------------");
print(payment_sts);
    return payment_sts;

  }
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
                  InkWell(
                    // borderRadius: BorderRadius.circular(15.0),
                      splashColor: Colors.black12,
                    onTap: (){
                      _character = "Resume2";
                    },child:Expanded(
                      child:Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Resume2.png'),
                                fit: BoxFit.fill),
                          )))),
                  const SizedBox(
                    width: 40,
                  ),


                  InkWell(
                    // borderRadius: BorderRadius.circular(15.0),
                      splashColor: Colors.black12,
                    onTap: (){
                      _character = "Resume1";
                    },child:Expanded(
                      child:Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Resume1.png'),
                                fit: BoxFit.fill),
                          )))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [

                InkWell(
                  // borderRadius: BorderRadius.circular(15.0),
                    splashColor: Colors.black12,
                    onTap: (){
                      _character = "Resume5";
                    },child:Expanded(child:
                Container(
                    width: 70,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Resume5.png'),
                          fit: BoxFit.fill),
                    )))),
                const SizedBox(
                  width: 40,
                ),


                InkWell(
                  // borderRadius: BorderRadius.circular(15.0),
                    splashColor: Colors.black12,
                    onTap: (){
                      _character = "Resume4";
                    },child: Expanded(child:
                Container(
                    width: 70,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Resume4.png'),
                          fit: BoxFit.fill),
                    )))),
              ]),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                // borderRadius: BorderRadius.circular(15.0),
                splashColor: Colors.black12,
                onTap: () async {
                  Navigator.pop(context);
                  if (payment_status == 'paid') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PdfApp(id:widget.id,color:widget.color,template:_character)),
                    );
                  }
                  else {
                    showDialog(
                        context: context,
                        builder: (BuildContext
                        context) {
                          return JoinRePlus(id: widget.id,
                              color: widget.color,
                              template: _character);
                        });
                  }
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
