import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/education.dart';
import 'package:join_re/screens/employee/work_exp.dart';

class WorkExpItemWidget extends StatefulWidget {
  final index;
  const WorkExpItemWidget({Key? key, this.index}) : super(key: key);

  @override
  State<WorkExpItemWidget> createState() => _WorkExpItemWidgetState();
}



class _WorkExpItemWidgetState extends State<WorkExpItemWidget> {
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
              // value: emp_country,
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
