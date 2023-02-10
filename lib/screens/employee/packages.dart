import 'dart:async';

import 'package:flutter/material.dart';
import 'package:join_re/screens/main_page.dart';
import '../../utils/constants/colors.dart';

class Packages extends StatefulWidget {

  final packages;
  final login;
  const Packages({Key? key, this.packages,this.login}) : super(key: key);

  @override
  State<Packages> createState() => _PackagesState();
}

var password = TextEditingController();

final username = TextEditingController(text: '');
final formKey = GlobalKey<FormState>();
final obj_MainPageState = MainPage();

@override
class _PackagesState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Packages - FRAME

    return SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.18,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                106, 106, 106, 0.15000000596046448),
                            offset: Offset(0, 2),
                            blurRadius: 10)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Vector_business_woman_character5901011.png'),
                                  fit: BoxFit.fitHeight),
                            )),
                        const Text(
                          'Packages',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              fontFamily: 'Open Sans',
                              fontSize: 32,
                              letterSpacing:
                                  1 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                        // bottomRight: Radius.circular(0),
                      ),
                      gradient: Linear_Gradient),
                  child:
                    Expanded(
                        child:  ListView.builder(
                          // itemCount: models.length,
                          itemCount: widget.packages['count']??0,
                          itemBuilder: (context, index) => Card(
                              child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 155,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          width: 1.5,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Trophy.png'),
                            fit: BoxFit.none),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.packages['packages'][index]['plan']}',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                fontFamily: 'Open Sans',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1.25),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rs ${widget.packages['packages'][index]['amount']}/-',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1.25),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.packages['packages'][index]['description']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                fontFamily: 'Roboto',
                                fontSize: 8,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.packages['packages'][index]['amount']}',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 54, 115, 1),
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1.25),
                          ),
                          SizedBox(height: 20),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainPage(pg: 5,login:widget.login ,package_id:widget.packages['packages'][index]['id'])),
                                    );
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 95,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            'Buy',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Roboto',
                                                fontSize: 10,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ))),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainPage(pg: 5,login:widget.login)),
                                    );
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 95,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: Color.fromRGBO(170, 197, 1, 1),
                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            'Renewal',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Roboto',
                                                fontSize: 10,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ))),
                                ),
                                SizedBox(width: 10),
                              ])
                        ],
                      ),
                    )),

                        ))

                )
              ],
            )));
  }
}
