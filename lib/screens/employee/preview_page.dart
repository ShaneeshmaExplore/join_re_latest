import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/basic_info_widget_view.dart';
import 'package:join_re/screens/employee/education_item_widget.dart';
import 'package:join_re/screens/employee/education_item_widget_view.dart';
import 'package:join_re/screens/employee/work_exp_item_widget.dart';
import 'package:join_re/screens/employee/work_exp_item_widget_view.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:join_re/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewPage extends StatefulWidget {
  final data;
  const PreviewPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

enum SingingCharacter { Ongoing, Fresher }

SingingCharacter? edu_type = SingingCharacter.Ongoing;
DateTime selectedDate = DateTime.now();

List<String> listitems = [
  "India",
  "United States of America",
  "Canada",
  "United Kingdom",
  "China",
  "Russia",
  "Austria"
];

String? sel_country;
String? emp_country;
//
// var title_of_qfn = TextEditingController();
// var orgnzn = TextEditingController();
// var addr_orgn = TextEditingController();
// var org_pin = TextEditingController();
// var edu_period_from = TextEditingController();
// var edu_period_to = TextEditingController();
// var org_city = TextEditingController();

var arrData;
//
// var emp_address = TextEditingController();
// var emp_pin = TextEditingController();
// var emp_city = TextEditingController();
// var exp_country_id = TextEditingController();
// var occupation = TextEditingController();
// var employer = TextEditingController();
// var emp_from = TextEditingController();
// var emp_to = TextEditingController();
// var reponsibility = TextEditingController();

enum Gender { Male, Female }

// Gender? _gender = Gender.Female;

var name = TextEditingController();
var email = TextEditingController();
var dob = TextEditingController();
var mobile = TextEditingController();
var captcha = TextEditingController();
var password = TextEditingController();
var gender = TextEditingController();

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

var country_list = List<dynamic>.empty();

class _PreviewPageState extends State<PreviewPage> with InputValidationMixin {
  bool _isLoading = false;

  Future<String> fetchData() async {
    var res = await Network().authData('', '/list_company_type');
    var body = json.decode(res.body);
    setState(() {
      country_list = body['country'];
    });
    return "Success";
  }
  setData() {
    print(widget.data);
    name.text = widget.data['user']['name'];
    email.text = widget.data['user']['email'];
    dob.text = widget.data['user']['dob'];
    mobile.text = widget.data['user']['mobile'];
    gender.text = widget.data['user']['gender'];
    password.text = widget.data['user']['password'] ?? '';
    //
    // title_of_qfn.text = widget.data['title_of_qualification'] ?? '';
    // orgnzn.text = widget.data['organization_providing_training'] ?? '';
    // addr_orgn.text = widget.data['edu_address']??'';
    // org_pin.text = widget.data['edu_pin']??'';
    // edu_period_from.text = widget.data['edu_period_from']??'';
    // edu_period_to.text = widget.data['edu_period_to']??'';
    // education_status.text = widget.data['education_status']??'';
    // org_city.text = widget.data['edu_city']??'';
    // org_city.text = widget.data['edu_country']??'';
    // org_city.text = widget.data['edu_status']??'';
    //
    // emp_address.text = widget.data['exp_address']??'';
    // emp_pin.text = widget.data['exp_pin']??'';
    // emp_city.text = widget.data['exp_city']??'';
    // exp_country_id.text = widget.data['exp_country']??'';
    // occupation.text = widget.data['occupation_position_held']??'';
    // employer.text = widget.data['employer']??'';
    // emp_from.text = widget.data['exp_period_from']??'';
    // emp_to.text = widget.data['exp_period_to']??'';
    // reponsibility.text = widget.data['activities_reponsibilities']??'';
  }
  @override
  Widget build(BuildContext context) {
    widget.data == null
        ? Center(child: CircularProgressIndicator())
        :setData();
    List<Widget> _cardList = [];
    final List<Widget> _cardListBasic = [
      BasicInfoWidgetView(data: widget.data)
    ];
    List<Widget> _cardListEdu = [];
    @override
    void _addCardWidget() {
      setState(() {
        _cardList.add(WorkExpItemWidget());
      });
    }

    @override
    void _addCardWidgetEdu() {
      setState(() {
        _cardListEdu.add(EducationItemWidget());
      });
    }

    @override
    void initState() {
      super.initState();
      captcha.text = getRandomString(5);
      // password.text = widget.data['password'];
    }
    // Figma Flutter Generator PreviewPage - FRAME
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                // Navigator.pushNamed(context, '/work_exp');
              }
            },
            child: SingleChildScrollView(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    // alignment:Alignment.center ,
                    child: Column(children: <Widget>[
                      Stack(children: [
                        Positioned(
                          top: 325,
                          left: -190,
                          child: Container(
                              width: 735,
                              height: 735,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    57, 54, 115, 0.07999999821186066),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(500, 500)),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(
                              minHeight: 680, maxHeight: double.infinity),
                          margin: const EdgeInsets.all(30.0),
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
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Basic Information",
                                            style: TextStyle(
                                                color: Color(0xff3A3673),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Open Sans',
                                                fontSize: 20)),
                                        // SizedBox(
                                        //   height: 30,
                                        // ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: _cardListBasic.length,
                                            itemBuilder: (context, index) {
                                              return _cardListBasic[index];
                                            }),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Education",
                                                  style: TextStyle(
                                                      color: Color(0xff3A3673),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 20)),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  // itemCount:_cardListEdu.length,
                                                  itemCount:widget.data['education'].length,

                                                  itemBuilder:
                                                      (context, index) {
                                                        return EducationItemWidgetView(data: widget.data['education'][index]);

                                                        // return _cardListEdu[index];
                                                  }),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: 10,
                                                  )),
                                                  GestureDetector(
                                                      onTap: () {
                                                        _addCardWidgetEdu();
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                      )),
                                                ],
                                              ),
                                            ]),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        // ]),
                                        Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Work Experience",
                                                  style: TextStyle(
                                                      color: Color(0xff3A3673),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 20)),
                                              // SizedBox(
                                              //   height: 30,
                                              // ),

                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  // itemCount: _cardList.length,
                                                  itemCount:widget.data['work_exp'].length,

                                                  itemBuilder:
                                                      (context, index) {
                                                    return WorkExpItemWidgetView(data: widget.data['work_exp'][index]);
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
                                              Container(
                                                  width: 400,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromRGBO(
                                                                          58,
                                                                          54,
                                                                          115,
                                                                          1)),
                                                      onPressed: () {
                                                        // if (formGlobalKey.currentState.validate()) {
                                                        //   formGlobalKey.currentState.save();
                                                        //   // use the email provided here
                                                        // }
                                                        _register();
                                                        // Navigator.pushNamed(context,
                                                        //     "/employee_home");
                                                      },
                                                      child: Text("Submit")))
                                            ]),
                                      ]))),
                        ),

                      ]),
                    ])))));
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "api": true,
      "id":widget.data['user']['id'],
      "name": name.text,
      "type": "Seeker",
      "gender": gender.text,
      "dob": dob.text,
      "mobile": mobile.text,
      "email": email.text,
      "password": password.text,
      "status": "Active",
      "org_address": addr_orgn.text,
      "org_pin": org_pin.text,
      "org_city": org_city.text,
      "edu_country_id": sel_country,
      "qualification": title_of_qfn.text,
      "organization": orgnzn.text,
      "edu_from": edu_period_from.text,
      "edu_to": edu_period_to.text,
      "edu_status": "Ongoing",
      "emp_address": emp_address.text,
      "emp_pin": emp_pin.text,
      "emp_city": emp_city.text,
      "exp_country_id": emp_country,
      "occupation": occupation.text,
      "employer": employer.text,
      "emp_from": emp_from.text,
      "emp_to": emp_to.text,
      "reponsibility": reponsibility.text,
    };
    var res = await Network().authData(data, '/save_job_seeker');
    var body = json.decode(res.body);
    if (body['success']) {
      print("*****************-------------------*****************");
      List<dynamic> items = [body['user'], body['id']];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MainPage(
            pg: 0,
            login: items,
            package_id: '',
          ),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
