import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/education_item_widget.dart';
import 'package:join_re/screens/employee/work_exp.dart';

class Education extends StatefulWidget {
  final data;
  const Education({Key? key, this.data}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final ScrollController listScrollController = new ScrollController();


  @override
  Widget build(BuildContext context) {
    List<Widget> _cardList = [EducationItemWidget(data:widget.data)];

    void _addCardWidget() {
      setState(() {
        _cardList.add(EducationItemWidget(data:widget.data));
      });
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: GestureDetector(
              onPanUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {
                  // Navigator.pushReplacementNamed(
                  //     context, '/basic_info_employee');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BasicInfo(data:widget.data,
                      ),),);
                }

                // Swiping in left direction.
                if (details.delta.dx < 0) {
                  // Navigator.pushReplacementNamed(context, '/work_exp');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WorkExp(data:widget.data,
                      ),),);
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
                                                  fontWeight: FontWeight.bold,
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
                                        ]))),
                          ),
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
                              // Navigator.pushReplacementNamed(
                              //     context, "/basic_info_employee");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BasicInfo(data:widget.data,
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
                        alignment: FractionalOffset.bottomCenter,
                        child: GestureDetector(
                            onTap: () {
                              // Swiping in right direction.
                              // Navigator.pushReplacementNamed(
                              //     context, '/work_exp');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WorkExp(data:widget.data,
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
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacementNamed(
                              //     context, "/work_exp");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WorkExp(data:widget.data,
                                  ),),);
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
    );
  }
}
