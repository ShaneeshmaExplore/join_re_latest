import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/education.dart';

class EducationItemWidget extends StatefulWidget {
  final index;
  final data;
  const EducationItemWidget({Key? key, this.index,this.data}) : super(key: key);

  @override
  State<EducationItemWidget> createState() => _EducationItemWidgetState();
}

enum SingingCharacter { Ongoing, Fresher }

SingingCharacter? _character = SingingCharacter.Ongoing;
DateTime selectedDate = DateTime.now();

var title_of_qfn  = TextEditingController();
var exp_to  = TextEditingController();
var edu_period_from  = TextEditingController();
var edu_period_to  = TextEditingController();
var dob = TextEditingController();

List<String> listitems = [
  "India",
  "United States of America",
  "Canada",
  "United Kingdom",
  "China",
  "Russia",
  "Austria"
];
String selectval = "India";

class _EducationItemWidgetState extends State<EducationItemWidget> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // selectval = widget.data['country_id'];
    dob.text = widget.data['dob'];
    _character = widget.data['education_status'];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 365,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.data['title_of_qualification']?? '',
              // controller:title_of_qfn,
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
              initialValue: widget.data['organization_providing_training']?? '',
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
              initialValue:widget.data['edu_address'] ?? '',
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
                    initialValue:widget.data['edu_pin'] ?? '',
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
                    initialValue:widget.data['edu_city'] ?? '',
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
                value: selectval,
                iconEnabledColor: Color(0xff3A3673),
                style: const TextStyle(
                  color: Color(0xff3A3673),
                  fontSize: 10,
                ),
                onChanged: (value) {
                  setState(() {
                    selectval = value.toString();
                  });
                },
                items: listitems.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextFormField(
                    initialValue:widget.data['edu_period_from'] ?? '',
                    // controller: edu_period_from,
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
                    initialValue:widget.data['edu_period_to'] ?? '',
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
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
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
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              )))))),
            ]),
          ],
        ));
  }
}
