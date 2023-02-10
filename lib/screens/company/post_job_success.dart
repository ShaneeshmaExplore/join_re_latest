import 'dart:async';
import 'package:flutter/material.dart';
import 'package:join_re/screens/company/employer_home.dart';
import 'package:join_re/screens/main_page_employer.dart';

class PostJobSuccess extends StatefulWidget {
  final login_id;
  const PostJobSuccess({Key? key, this.login_id,}) : super(key: key);
  @override
  _PostJobSuccessState createState() => _PostJobSuccessState();
}

class _PostJobSuccessState extends State<PostJobSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => Options()
    //   )
    // );
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPageEmployer(pg: 1,login:widget.login_id)),
    );
  }

  Widget build(BuildContext context) {
    // Figma Flutter Generator ConfirmetionpageWidget - FRAME

    // Figma Flutter Generator ConfirmetionpageWidget - FRAME
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: MediaQuery.of(context).size.height * 0.07 ,
              left: MediaQuery.of(context).size.width * 0.07 ,
              child: Container(
                alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width *0.85,
                  height: MediaQuery.of(context).size.height*0.85 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Color.fromRGBO(58, 54, 115, 1),
                      width: 2,
                    ),
                  ))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.45 ,
              left: MediaQuery.of(context).size.width * 0.3 ,
              child: Text(
                'Job Posted \n successfully ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(58, 54, 115, 1),
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top:MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.3 ,
              child: Container(
                  width: 138.63998413085938,
                  height: 138.63998413085938,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/component.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 287,
              left: -143,
              child: Container(
                  width: 392,
                  height: 457,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/job_post.png'),
                        fit: BoxFit.fitWidth),
                  ))),
        ])));
  }
}
