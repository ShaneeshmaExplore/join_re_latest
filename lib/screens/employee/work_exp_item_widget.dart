import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/education.dart';

class WorkExpItemWidget extends StatefulWidget {
  final index;
  final data;
  const WorkExpItemWidget({Key? key, this.index, this.data}) : super(key: key);

  @override
  State<WorkExpItemWidget> createState() => _WorkExpItemWidgetState();
}

enum SingingCharacter { Ongoing, Fresher }

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

class _WorkExpItemWidgetState extends State<WorkExpItemWidget> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingControllerTO = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  SingingCharacter? _character = SingingCharacter.Ongoing;

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

  // @override
  // void initState() {
  //   super.initState();
  //   _textEditingController.text = widget.data['exp_period_from'];
  //   _textEditingControllerTO.text = widget.data['exp_period_to'];
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Column(children: [
          TextFormField(
            initialValue:widget.data['occupation_position_held'] ?? '',

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
            initialValue:widget.data['employer'] ?? '',

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
            initialValue:widget.data['exp_address'] ?? '',

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
                  initialValue:widget.data['exp_pin'] ?? '',

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
                  initialValue:widget.data['exp_city'] ?? '',

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
                  controller: _textEditingController,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Show Date Picker Here
                    await _selectDate(context);
                    _textEditingController.text =
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
                  _textEditingController.text =
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
                  controller: _textEditingControllerTO,
                  onTap: () async {
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Show Date Picker Here
                    await _selectDate(context);
                    _textEditingControllerTO.text =
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
                  _textEditingControllerTO.text =
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
            initialValue:widget.data['activities_reponsibilities'] ?? '',

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
