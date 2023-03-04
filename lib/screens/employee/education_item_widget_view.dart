import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/preview_page.dart';
import 'package:join_re/utils/api.dart';

class EducationItemWidgetView extends StatefulWidget {
  final data;
  const EducationItemWidgetView({Key? key,this.data }) : super(key: key);

  @override
  State<EducationItemWidgetView> createState() => _EducationItemWidgetViewState();
}

var country_list_edu = List<dynamic>.empty();
var title_of_qfn = TextEditingController();
var orgnzn = TextEditingController();
var addr_orgn = TextEditingController();
var org_pin = TextEditingController();
var edu_period_from = TextEditingController();
var edu_period_to = TextEditingController();
var org_city = TextEditingController();

class _EducationItemWidgetViewState extends State<EducationItemWidgetView> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime now = new DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 1),
        lastDate: DateTime(now.year,now.month,now.day));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

      });
    }
  }

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

    title_of_qfn.text = widget.data['title_of_qualification'] ?? '';
    orgnzn.text = widget.data['organization_providing_training'] ?? '';
    addr_orgn.text = widget.data['edu_address']??'';
    org_pin.text = widget.data['edu_pin']??'';
    edu_period_from.text = widget.data['edu_period_from']??'';
    edu_period_to.text = widget.data['edu_period_to']??'';
    sel_country = widget.data['edu_country'];
    // org_city = widget.data['edu_city'];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 365,
        child: Column(
          children: [
            TextFormField(
              controller:title_of_qfn,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff3A3673),
                  fontFamily: 'Open Sans'),
              decoration: InputDecoration(
                // border: Outline(),
                labelText: 'Title of qualification awarded',
              ),
            ),
            TextFormField(
              controller:orgnzn,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff3A3673),
                  fontFamily: 'Open Sans'),
              decoration: InputDecoration(
                // border: Outline(),
                labelText: 'Organization providing education and training',
              ),
            ),
            TextFormField(
              controller:addr_orgn,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff3A3673),
                  fontFamily: 'Open Sans'),
              decoration: InputDecoration(
                // border: Outline(),
                labelText: 'Address of the organization',
              ),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                    child: TextFormField(
                        controller:org_pin,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff3A3673),
                            fontFamily: 'Open Sans'),
                        decoration: InputDecoration(
                          labelText: 'Postal Code',
                        )),
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0.0, 0),
                    child: TextFormField(
                        controller:org_city,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff3A3673),
                            fontFamily: 'Open Sans'),
                        decoration: InputDecoration(
                          labelText: 'City',
                        )),
                  )),
            ]),
            Container(
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.topCenter,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  labelText: 'Country',
                ),

                value: sel_country,
                iconEnabledColor: Color(0xff3A3673),
                style: const TextStyle(
                  color: Color(0xff3A3673),
                  fontSize: 10,
                ),
                onChanged: (value) {
                  setState(() {
                    sel_country = value.toString();
                  });
                },
                items: country_list_edu.map((item) {
                  return new DropdownMenuItem(
                    child: new Text(item['country_name']),
                    value: item['id'].toString(),
                  );

                }).toList(),

              ),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                        controller: edu_period_from,
                        onTap: () async {
                          // Below line stops keyboard from appearing
                          FocusScope.of(context).requestFocus(new FocusNode());
                          // Show Date Picker Here
                          await _selectDate(context);
                          edu_period_from.text =
                              DateFormat('yyyy/MM/dd').format(selectedDate);
                        },
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff3A3673),
                            fontFamily: 'Open Sans'),
                        decoration: InputDecoration(
                          // border: Outline(),
                          labelText: 'From',
                        )),
                  )),
              GestureDetector(
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Show Date Picker Here
                    await _selectDate(context);
                    edu_period_from.text =
                        DateFormat('yyyy/MM/dd').format(selectedDate);
                  },
                  child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Calendar.png'),
                            fit: BoxFit.fitWidth),
                      ))),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                        controller: edu_period_to,
                        onTap: () async {
                          // Below line stops keyboard from appearing
                          FocusScope.of(context).requestFocus(new FocusNode());
                          // Show Date Picker Here
                          await _selectDate(context);
                          edu_period_to.text =
                              DateFormat('yyyy/MM/dd').format(selectedDate);
                        },
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff3A3673),
                            fontFamily: 'Open Sans'),
                        decoration: InputDecoration(
                          // border: Outline(),
                          labelText: 'To',
                        )),
                  )),
              GestureDetector(
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Show Date Picker Here
                    await _selectDate(context);
                    edu_period_to.text =
                        DateFormat('yyyy/MM/dd').format(selectedDate);
                  },
                  child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Calendar.png'),
                            fit: BoxFit.fitWidth),
                      )))
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                  child: ListTile(
                      title: const Text('Ongoing',
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              fontFamily: 'Open Sans',
                              fontSize: 10,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1)),
                      horizontalTitleGap: 1,
                      leading: Transform.scale(
                        scale: 1,
                        child: Container(
                            width: 5,
                            child: (Radio<SingingCharacter>(
                              value: SingingCharacter.Ongoing,
                              groupValue: edu_type,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  edu_type = value;
                                });
                              },
                            ))),
                      ))),
              Expanded(
                  child: ListTile(
                      title: const Text(
                        'Fresher',
                        style: TextStyle(
                            color: Color.fromRGBO(58, 54, 115, 1),
                            fontFamily: 'Open Sans',
                            fontSize: 10,
                            letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      horizontalTitleGap: 1,
                      leading: Transform.scale(
                          scale: 1,
                          child: Container(
                              width: 5,
                              child: (Radio<SingingCharacter>(
                                value: SingingCharacter.Fresher,
                                groupValue: edu_type,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    edu_type = value;
                                  });
                                },
                              )))))),
            ]),
          ],
        ));
  }
}
