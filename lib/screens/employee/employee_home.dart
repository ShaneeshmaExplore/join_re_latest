import 'dart:async';
  import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/add_photo.dart';
import 'package:join_re/screens/employee/popup/add_video.dart';
import 'package:join_re/screens/employee/popup/change_password.dart';
import 'package:join_re/screens/employee/popup/cv_color.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../utils/constants/colors.dart';

class EmployeeHome extends StatefulWidget {
  final String name;
  final int id;
const EmployeeHome({Key? key, required this.name, required this.id,}) : super(key: key);

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

var password = TextEditingController();

final username = TextEditingController(text: '');
final formKey = GlobalKey<FormState>();

@override
class _EmployeeHomeState extends State<EmployeeHome> {
  double percent = 0.0;

  @override
  void initState() {
    Timer timer = Timer.periodic(const Duration(microseconds: 0), (timer) {});
    timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      setState(() {
        percent += 50;
        if (percent >= 100) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EmployeeHome - FRAME

    return  SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child:widget.name == null
            ? Center(child: CircularProgressIndicator())
            :Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 120,
                            height: 190,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Vector_business_woman_character5901011.png'),
                                  fit: BoxFit.fitHeight),
                            )),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                alignment: Alignment.center,
                                width: 190,
                                height: 65,
                                decoration: const BoxDecoration(
                                      image: DecorationImage( image: AssetImage('assets/images/hello.png'),
                                      fit: BoxFit.fill),
                                ),
                                padding: const EdgeInsets.all(5),
                                child:    Text('Hi ${widget.name}, Welcome to JoinRe',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        // backgroundColor: Color.fromRGBO(58, 54, 115, 1),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1)),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                      child: CircularPercentIndicator(
                                    radius: 45.0,
                                    lineWidth: 5.0,
                                    percent: 100 / 100,
                                    progressColor:
                                        Color.fromRGBO(58, 54, 115, 1),
                                  )),
                                  Center(
                                      child: CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 5.0,
                                    animation: true,
                                    percent: percent / 100,
                                    center: Text(
                                      percent.toString() + "%",
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor:
                                        const Color.fromRGBO(170, 198, 2, 1),
                                  ))
                                ],
                              ),
                              const Text(
                                'Completed  \nProfile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(58, 54, 115, 1),
                                    fontFamily: 'Open Sans',
                                    fontSize: 12,
                                    letterSpacing:
                                        0.5 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ])
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.51952,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                        // bottomRight: Radius.circular(0),
                      ),
                      gradient: Linear_Gradient),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                            width: 173.45242309570312,
                            height: 86.72621154785156,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Join_rew011.png'),
                                  fit: BoxFit.fitWidth),
                            )),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(children: [
                          // Expanded(
                          //     child: /*view profile*/
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                // borderRadius: BorderRadius.circular(15.0),
                                splashColor: Colors.black12,
                                  onTap: () {
                                    List<dynamic> items = [widget.name,widget.id];
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(pg: 3,login:items)),
                                  );
                                },

                                child: Container(
                                  width: 158,
                                  height: 70,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 32,
                                            height: 32,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Usershield.png'),
                                                  fit: BoxFit.fitWidth),
                                            )),
                                        const Text(
                                          'View Profile',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  58, 54, 115, 1),
                                              fontFamily: 'Open Sans',
                                              fontSize: 12,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height: 1.25),
                                        )
                                      ]),
                                ),
                              ),
                            // ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //     child:
                              /*view profile*/ Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        // borderRadius: BorderRadius.circular(15.0),
                                        splashColor: Colors.black12,
                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AddPhoto(id:widget.id);
                                              });
                                        },
                                        child: SizedBox(
                                          width: 158,
                                          height: 70,
                                          child: Container(
                                            width: 158,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4)
                                              ],
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Addimage.png'),
                                                            fit: BoxFit
                                                                .fitWidth),
                                                      )),
                                                  const Text(
                                                    'Add Photos',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.25),
                                                  )
                                                ]),
                                          ),
                                        // ),
                                      )))),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          // Expanded(
                          //     child:
                              /*view profile*/ Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        // borderRadius: BorderRadius.circular(15.0),
                                        splashColor: Colors.black12,

                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AddVideo(id:widget.id);
                                              });
                                        },
                                        child: SizedBox(
                                          width: 158,
                                          height: 70,
                                          child: Container(
                                            width: 158,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4)
                                              ],
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Video.png'),
                                                            fit: BoxFit
                                                                .fitWidth),
                                                      )),
                                                  const Text(
                                                    'Add Videos',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.25),
                                                  )
                                                ]),
                                          ),
                                        // ),
                                      )))),
                          const SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //     child:
                              /*view profile*/ Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        // borderRadius: BorderRadius.circular(15.0),
                                        splashColor:
                                            Color.fromRGBO(126, 119, 219, 1.0),
                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ChangePassword(id:widget.id);
                                              });
                                        },
                                        child: SizedBox(
                                          width: 158,
                                          height: 70,
                                          child: Container(
                                            width: 158,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4)
                                              ],
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Secure.png'),
                                                            fit: BoxFit
                                                                .fitWidth),
                                                      )),
                                                  const Text(
                                                    'Change password',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.25),
                                                  )
                                                ]),
                                          ),
                                        // ),
                                      )))),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          // Expanded(
                          //     child:
                              /*view profile*/ Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        // borderRadius: BorderRadius.circular(15.0),
                                        splashColor: Colors.black12,
                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CVColor(id:widget.id);
                                              });
                                        },
                                        child: SizedBox(
                                          width: 158,
                                          height: 70,
                                          child: Container(
                                            width: 158,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4)
                                              ],
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Downloadresume.png'),
                                                            fit: BoxFit
                                                                .fitWidth),
                                                      )),
                                                  const Text(
                                                    'Download Your CV',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.25),
                                                  )
                                                ]),
                                          ),
                                        // ),
                                      )))),
                          const SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //     child:
                              /*view profile*/ Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        // borderRadius: BorderRadius.circular(15.0),
                                        splashColor: Colors.black12,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainPage(pg: 4,login: [widget.name,widget.id],)),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 158,
                                          height: 70,
                                          child: Container(
                                            width: 158,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4)
                                              ],
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Adddollar.png'),
                                                            fit: BoxFit
                                                                .fitWidth),
                                                      )),
                                                  const Text(
                                                    'JoinRe Plus',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            58, 54, 115, 1),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.25),
                                                  )
                                                ]),
                                          ),
                                        // ),
                                      )))),
                        ]),
                        const SizedBox(
                          height: 50,
                        ),

                      ]),
                )
              ],
            )));
  }
}
