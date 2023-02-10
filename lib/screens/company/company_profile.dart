import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/company/profile_updated_employer.dart';

import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/utils/api.dart';


class CompanyProfile extends StatefulWidget {
  final data;
  const CompanyProfile({Key? key, this.data}) : super(key: key);

  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
const List<String> companyList = <String>['One', 'Two', 'Three', 'Four'];
String dropdownValue = list.first;
String company_list_dropdownValue = companyList.first;

TextEditingController tag_line = TextEditingController();
TextEditingController company_website = TextEditingController();
TextEditingController industry_name = TextEditingController();
TextEditingController company_mail = TextEditingController();
TextEditingController company_type = TextEditingController();
TextEditingController company_description = TextEditingController();
TextEditingController company_head_quarters = TextEditingController();
TextEditingController company_address = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController pin = TextEditingController();


@override
class _CompanyProfileState extends State<CompanyProfile>
    with InputValidationMixin {
  bool _isLoading = false;

  void _register_employer()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      "tag_line" : tag_line.text,
      "type" : "Provider",
      "company_website" : company_website.text,
      "industry_name" : industry_name.text,
      "company_mail" : company_mail.text,
      "company_type" : company_type.text,
      "company_description" : company_description.text,
      "company_head_quarters" : company_head_quarters.text,
      "company_address" : company_address.text,
      "city" : city.text,
      "pin" : pin.text,

    };
    data.addAll(widget.data);

    var res = await Network().authData(data, '/save_job_provider');
    var body = json.decode(res.body);
    if(body['success']){
      tag_line.text = "";
      company_website.text = "";
      industry_name.text = "";
      company_mail.text = "";
      company_type.text = "";
      company_description.text = "";
      company_head_quarters.text = "";
      company_address.text = "";
      city.text = "";
      pin.text = "";
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ProfileUpdatedEmployer()
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {
                  Navigator.pushReplacementNamed(
                      context, '/basic_info_employer');
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
                              // height: MediaQuery.of(context).size.height,
                              constraints: BoxConstraints(
                                  minHeight:
                                  MediaQuery.of(context).size.height - 90,
                                  maxHeight: double.infinity),
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.fromLTRB(30, 0, 30,
                                  0), // padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(58, 54, 115, 1),
                                  width: 1.5,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text("Company Profile",
                                              style: TextStyle(
                                                  color: Color(0xff3A3673),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 20)),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Stack(children: [
                                            Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff3A3673),
                                                        fontFamily:
                                                            'Open Sans'),
                                                    controller: tag_line,
                                                    decoration: InputDecoration(
                                                      // border: Outline(),
                                                      labelText:
                                                          'Tagline of the Company',
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff3A3673),
                                                        fontFamily:
                                                            'Open Sans'),
                                                    controller: company_website,
                                                    decoration: InputDecoration(
                                                      // border: Outline(),
                                                      labelText:
                                                          'Company Website',
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff3A3673),
                                                        fontFamily:
                                                            'Open Sans'),
                                                    controller: industry_name,
                                                    decoration: InputDecoration(
                                                      // border: Outline(),
                                                      labelText:
                                                          'Industry Name',
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff3A3673),
                                                        fontFamily:
                                                            'Open Sans'),
                                                    controller: company_mail,
                                                    decoration: InputDecoration(
                                                      // border: Outline(),
                                                      labelText: 'Company Mail',
                                                    ),
                                                  ),
                                                ]),
                                          ]),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelText: 'Company Type',
                                            ),
                                            value: company_list_dropdownValue,
                                            icon: const Icon(
                                                Icons.arrow_drop_down_sharp),
                                            elevation: 0,
                                            style: const TextStyle(
                                              color: Color(0xff3A3673),
                                              fontSize: 10,
                                            ),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                company_list_dropdownValue =
                                                    value!;
                                              });
                                            },
                                            items: companyList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          TextFormField(
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff3A3673),
                                                fontFamily: 'Open Sans'),
                                            controller: company_description,
                                            decoration: InputDecoration(
                                              // border: Outline(),
                                              labelText:
                                                  'Description of the Company',
                                            ),
                                          ),
                                          TextFormField(
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff3A3673),
                                                fontFamily: 'Open Sans'),

                                            controller: company_head_quarters,
                                            decoration: InputDecoration(
                                              // border: Outline(),
                                              labelText:
                                                  'Headquarters of the Company',
                                            ),
                                          ),
                                          TextFormField(
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff3A3673),
                                                fontFamily: 'Open Sans'),
                                            controller: company_address,
                                            decoration: InputDecoration(
                                              // border: Outline(),
                                              labelText:
                                                  'Address of the Company',
                                            ),
                                          ),
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 10.0, 0),
                                                  child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff3A3673),
                                                          fontFamily:
                                                              'Open Sans'),
                                                      controller: pin,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Postal Code',
                                                      )),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0.0, 0),
                                                  child: TextFormField(
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff3A3673),
                                                          fontFamily:
                                                              'Open Sans'),

                                                      controller: city,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'City',
                                                      )),
                                                )),
                                              ]),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelText: 'Country',
                                            ),
                                            value: dropdownValue,
                                            icon: const Icon(
                                                Icons.arrow_drop_down_sharp),
                                            elevation: 0,
                                            style: const TextStyle(
                                              color: Color(0xff3A3673),
                                              fontSize: 10,
                                            ),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            items: list
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                              width: 400,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color.fromRGBO(58,
                                                                  54, 115, 1)),
                                                  onPressed:(){ //if button is pressed, setstate sending = true, so that we can show "sending..."
                                                    // setState(() {
                                                    //   sending = true;
                                                    // });
                                                    _register_employer();                                                  },
                                                  child: Text(
                                                    "Save",
                                                    //if sending == true then show "Sending" else show "SEND DATA";
                                                  ),
                                                  // onPressed: () {
                                                  //   // if (formGlobalKey.currentState.validate()) {
                                                  //   //   formGlobalKey.currentState.save();
                                                  //   //   // use the email provided here
                                                  //   // }
                                                  //   Navigator.pushReplacementNamed(
                                                  //       context,
                                                  //       "/profile_updated_employer");
                                                  // },
                                                  ))
                                        ]))),
                            Positioned(
                              top: 30,
                              left: 110,
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
                            )
                          ]);
                        })),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                                  context, "/basic_info_employer");
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
                        width: 20,
                      ),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: GestureDetector(
                            onTap: () {
                              // Swiping in right direction.
                              Navigator.pushReplacementNamed(
                                  context, '/basic_info_employer');
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
                        width: 50,
                      ),
                    ])),
              ]))),
    );
  }
}
