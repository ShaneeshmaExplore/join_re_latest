import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/education_item_widget.dart';
import 'package:join_re/screens/employee/work_exp.dart';
import 'package:join_re/utils/api.dart';

class Education extends StatefulWidget {
  final data;
  const Education({Key? key, this.data}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

enum SingingCharacter { Ongoing, Fresher }

SingingCharacter? edu_type = SingingCharacter.Ongoing;
DateTime selectedDate = DateTime.now();

String sel_country = "India";
var country_list_edu = List<dynamic>.empty();

var title_of_qfn = TextEditingController();
var orgnzn = TextEditingController();
var addr_orgn = TextEditingController();
var org_pin = TextEditingController();
var edu_period_from = TextEditingController();
var edu_period_to = TextEditingController();
var org_city = TextEditingController();

class _EducationState extends State<Education> {
  final ScrollController listScrollController = new ScrollController();
  final formGlobalKeyEdu = GlobalKey<FormState>();

  Future<String> fetchData() async {
    var res = await Network().authData('', '/list_company_type');
    var body = json.decode(res.body);
    setState(() {
      country_list_edu = body['country'];

    });


    return "Success";
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _cardList = [EducationItemWidget()];

    void _addCardWidget() {
      setState(() {
        _cardList.add(EducationItemWidget());
      });
    }

    void _next_work_exp() {
      var data = {
        "api": true,
        "name": widget.data['name'],
        "type": widget.data['type'],
        "gender": widget.data['gender'],
        "dob": widget.data['dob'],
        "mobile": widget.data['mobile'],
        "email": widget.data['email'],
        "password": widget.data['password'],
        "status": widget.data['status'],
        "mobile_verified":widget.data['mobile_verified'],
        "email_verified":widget.data['email_verified'],
        "org_address": addr_orgn.text,
        "org_pin": org_pin.text,
        "org_city": org_city.text,
        "edu_country_id": sel_country,
        "qualification": title_of_qfn.text,
        "organization": orgnzn.text,
        "edu_from": edu_period_from.text,
        "edu_to": edu_period_to.text,
        "edu_status": "Ongoing"
      };
      print("**************************");
      print(title_of_qfn.text);
      print("**************************");

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WorkExp(data: data)));
    }

    return Form(
        key: formGlobalKeyEdu,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
              child: GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0) {
                      Navigator.pushReplacementNamed(
                          context, '/basic_info_employee');
                    }

                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      Navigator.pushReplacementNamed(context, '/work_exp');
                    }
                  },
                  // child: SingleChildScrollView(
                  child: Column(children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Stack(children: [
                              Positioned(
                                top: 30,
                                left: 110,
                                child: Container(
                                    alignment: Alignment.topRight,
                                    width: 210,
                                    height: 210,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(
                                          57, 54, 115, 0.07999999821186066),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(237.75, 237.75)),
                                    )),
                              ),
                              Container(
                                // height: 680,
                                constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height - 90,
                                    maxHeight: double.infinity),
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                // padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(58, 54, 115, 1),
                                    width: 1.5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Education",
                                                  style: TextStyle(
                                                      color: Color(0xff3A3673),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 20)),
                                              // SizedBox(
                                              //   height: 30,
                                              // ),

                                              Image.asset(
                                                'assets/images/school_boy.png',
                                                height: 180,
                                              ),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: _cardList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return _cardList[index];
                                                  }),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: 10,
                                                  )),
                                                  GestureDetector(
                                                      onTap: () {
                                                        _addCardWidget();
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                      )),
                                                ],
                                              ),
                                            ]))),
                              ),
                            ]);
                          }),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        // width: 101.00029754638672,
                        // height: 14,
                        child: Row(children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/basic_info_employee");
                                },
                                child: Text(
                                  'Back',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(58, 54, 115, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                )),
                          )),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: GestureDetector(
                                onTap: () {
                                  // Swiping in right direction.
                                  Navigator.pushReplacementNamed(
                                      context, '/basic_info_employee');
                                },
                                child: Container(
                                    width: 13.596155166625977,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(
                                              13.596155166625977, 14)),
                                    ))),
                          )),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                                width: 13.596155166625977,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(58, 54, 115, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(
                                          13.596155166625977, 14)),
                                )),
                          )),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: GestureDetector(
                                onTap: () {
                                  if (formGlobalKeyEdu.currentState!.validate()) {
                                    formGlobalKeyEdu.currentState!.save();
                                    _next_work_exp();
                                    // Swiping in right direction.
                                    // Navigator.pushReplacementNamed(
                                    //     context, '/work_exp');

                                  }
                                },
                                child: Container(
                                    width: 13.596155166625977,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(
                                              13.596155166625977, 14)),
                                    ))),
                          )),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: GestureDetector(
                                onTap: () {
                                  if (formGlobalKeyEdu.currentState!.validate()) {
                                    formGlobalKeyEdu.currentState!.save();
                                    _next_work_exp();
                                  } // Navigator.pushReplacementNamed(
                                  //     context, "/work_exp");
                                },
                                child: Text('Next',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1))),
                          )),
                          SizedBox(
                            width: 30,
                          ),
                        ])),
                  ]))),
        ));
  }
}
