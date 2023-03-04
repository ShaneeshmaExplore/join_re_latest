import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/preview_page.dart';

class WorkExpItemWidgetView extends StatefulWidget {
  final data;
  const WorkExpItemWidgetView({Key? key, this.data}) : super(key: key);

  @override
  State<WorkExpItemWidgetView> createState() => _WorkExpItemWidgetViewState();
}

var emp_address = TextEditingController();
var emp_pin = TextEditingController();
var emp_city = TextEditingController();
var exp_country_id = TextEditingController();
var occupation = TextEditingController();
var employer = TextEditingController();
var emp_from = TextEditingController();
var emp_to = TextEditingController();
var reponsibility = TextEditingController();

class _WorkExpItemWidgetViewState extends State<WorkExpItemWidgetView> {
  DateTime selectedDate = DateTime.now();
  final formGlobalKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = new DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(now.year,now.month,now.day));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    emp_address.text = widget.data['exp_address']??'';
    emp_pin.text = widget.data['exp_pin']??'';
    emp_city.text = widget.data['exp_city']??'';
    exp_country_id.text = widget.data['exp_country']??'';
    occupation.text = widget.data['occupation_position_held']??'';
    employer.text = widget.data['employer']??'';
    emp_from.text = widget.data['exp_period_from']??'';
    emp_to.text = widget.data['exp_period_to']??'';
    reponsibility.text = widget.data['activities_reponsibilities']??'';
    emp_country = widget.data['exp_country']??'';
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        height: 400,
        child: Column(children: [
          TextFormField(
            controller: occupation,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Occupation or position held',
            ),
          ),
          TextFormField(
            controller: employer,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Employer',
            ),
          ),
          TextFormField(
            controller: emp_address,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Address of the Employer',
            ),
          ),
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                  child: TextFormField(
                      controller: emp_pin,

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
                      controller: emp_city,

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
              value: emp_country,
              iconEnabledColor: Color(0xff3A3673),
              style: const TextStyle(
                color: Color(0xff3A3673),
                fontSize: 10,
              ),
              onChanged: (value) {
                setState(() {
                  emp_country = value.toString();
                });
              },
              items: country_list.map((item) {
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
                      controller: emp_from,
                      onTap: () async {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        await _selectDate(context);
                        emp_from.text =
                            DateFormat('yyyy/MM/dd').format(selectedDate);
                      },
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff3A3673),
                          fontFamily: 'Open Sans'),
                      decoration: InputDecoration(
                        // border: Outline(),
                        labelText: 'Period of training\nFrom',
                      )),
                )),
            GestureDetector(
                onTap: () async {
                  // Below line stops keyboard from appearing
                  FocusScope.of(context).requestFocus(new FocusNode());
                  // Show Date Picker Here
                  await _selectDate(context);
                  emp_from.text =
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
                      controller: emp_to,
                      onTap: () async {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        await _selectDate(context);
                        emp_to.text =
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
                  emp_to.text =
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
          TextFormField(
            controller: reponsibility,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff3A3673),
                fontFamily: 'Open Sans'),
            decoration: InputDecoration(
              // border: Outline(),
              labelText: 'Main activities and responsibilities',
            ),
          ),
        ]));
  }
}
