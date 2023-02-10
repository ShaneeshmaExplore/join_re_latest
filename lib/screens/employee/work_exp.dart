import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/education.dart';

import 'dart:math';
import 'package:join_re/screens/employee/work_exp_item_widget.dart';
import 'package:join_re/utils/api.dart';
import 'package:join_re/widgets/profile_updated.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkExp extends StatefulWidget {

  final data;
  const WorkExp({Key? key, this.data}) : super(key: key);
  @override
  _WorkExpState createState() => _WorkExpState();
}

class _WorkExpState extends State<WorkExp> with InputValidationMixin {
  List<Widget> _cardList =[];
      bool _isLoading = false;
  void _addCardWidget() {
    setState(() {
      _cardList.add(WorkExpItemWidget(data:widget.data));
    });
  }

  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var name;
    var gender;
    var dob;
    var mobile;
    var email;
    var password;
    var status;
    var org_address;
    var org_pin;
    var org_city;
    var edu_country_id;
    var qualification;
    var organization;
    var edu_from;
    var edu_to;
    var edu_status;
    var emp_address;
    var emp_pin;
    var emp_city;
    var exp_country_id;
    var occupation;
    var employer;
    var emp_from;
    var emp_to;
    var reponsibility;
    var id;
    var data = {
      "api":true,
      "id":widget.data['id'],
      "name" : name,
      "type" : "Seeker",
      "gender" : gender,
      "dob" : dob,
      "mobile" : mobile,
      "email" : email,
      "password" : password,
      "status" : status,

      "org_address" : org_address,
      "org_pin" : org_pin,
      "org_city" : org_city,
      "edu_country_id" : edu_country_id,

      "qualification" : qualification,
      "organization" : organization,
      "edu_from" : edu_from,
      "edu_to" : edu_to,
      "edu_status" : edu_status,

      "emp_address" : emp_address,
      "emp_pin" : emp_pin,
      "emp_city" : emp_city,
      "exp_country_id" : exp_country_id,

      "occupation" : occupation,
      "employer" : employer,
      "emp_from" : emp_from,
      "emp_to" : emp_to,
      "reponsibility" : reponsibility,

    };

    var res = await Network().authData(data, '/save_job_seeker');
    var body = json.decode(res.body);
    if(body['success']){
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ProfileUpdated()
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    _cardList = [WorkExpItemWidget(data:widget.data)];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: GestureDetector(
              onPanUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Education(data:widget.data,
                      ),),);
                  // Navigator.pushReplacementNamed(context, '/education');
                }
              },
              child: Column(children: [
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              // padding: const EdgeInsets.all(10.0),
                              constraints: BoxConstraints(
                                  minHeight:
                                  MediaQuery.of(context).size.height - 90,
                                  maxHeight: double.infinity),
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
                                            Text("Work Experience",
                                                style: TextStyle(
                                                    color: Color(0xff3A3673),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 20)),
                                            // SizedBox(
                                            //   height: 30,
                                            // ),

                                            Image.asset(
                                              'assets/images/work_exp.png',
                                              height: 160,
                                            ),

                                            ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: _cardList.length,
                                                itemBuilder: (context, index) {
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
                                                                Color.fromRGBO(
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

                                                    },
                                                    child: Text("Save")))
                                          ]))),
                            ),
                            Positioned(
                              top: 150,
                              left: 30,
                              child: Container(
                                  alignment: Alignment.topRight,
                                  width: 220,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        57, 54, 115, 0.07999999821186066),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(237.75, 237.75)),
                                  )),
                            ),
                          ]);
                        })),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacementNamed(
                              //     context, "/education");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Education(data:widget.data,
                                  ),),);
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
                              // Navigator.pushReplacementNamed(
                              //     context, '/basic_info_employee');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BasicInfo(data:widget.data,
                                  ),),);
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
                        child: GestureDetector(
                            onTap: () {
                              // Swiping in right direction.
                              // Navigator.pushReplacementNamed(
                              //     context, '/education');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Education(data:widget.data,
                                  ),),);
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
                                  Radius.elliptical(13.596155166625977, 14)),
                            )),
                      )),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomLeft,
                      )),
                      SizedBox(
                        width: 60,
                      ),
                    ])),
              ]))),
    );
  }
}
