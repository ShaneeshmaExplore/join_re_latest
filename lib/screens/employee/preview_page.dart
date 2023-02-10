import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/screens/employee/basic_info_widget.dart';
import 'package:join_re/screens/employee/education_item_widget.dart';
import 'package:join_re/screens/employee/work_exp_item_widget.dart';

class PreviewPage extends StatefulWidget {
  @override
  _PreviewPageState createState() => _PreviewPageState();
}


class _PreviewPageState extends State<PreviewPage> with InputValidationMixin {

  List<Widget> _cardList = [WorkExpItemWidget()];
  List<Widget> _cardListBasic = [BasicInfoWidget()];
  List<Widget> _cardListEdu = [EducationItemWidget()];

  @override
  void _addCardWidget() {
    setState(() {
      _cardList.add(WorkExpItemWidget());
    });
  }

  @override
  void _addCardWidgetEdu() {
    setState(() {
      _cardListEdu.add(EducationItemWidget());
    });
  }
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PreviewPage - FRAME

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body:   GestureDetector(
        onPanUpdate: (details) {
      // Swiping in right direction.
      if (details.delta.dx > 0) {
        Navigator.pushNamed(context, '/work_exp');
      }
    },
    child:SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                // alignment:Alignment.center ,
                child: Column(children: <Widget>[
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(
                          minHeight: 680, maxHeight: double.infinity),
                      margin: const EdgeInsets.all(30.0),
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
                      child:  Container(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Basic Information",
                                        style: TextStyle(
                                            color: Color(0xff3A3673),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Open Sans',
                                            fontSize: 20)),
                                    // SizedBox(
                                    //   height: 30,
                                    // ),
                                      ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _cardListBasic.length,
                                  itemBuilder: (context,index){
                                    return _cardListBasic[index];
                                  }),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Education",
                                              style: TextStyle(
                                                  color: Color(0xff3A3673),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 20)),

                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _cardListEdu.length,
                                              itemBuilder: (context,index){
                                                return _cardListEdu[index];
                                              }),
                                          Row(children: [
                                            Expanded(child: SizedBox(width: 10,)),
                                            GestureDetector(
                                                onTap: (){
                                                  _addCardWidgetEdu();
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                )),],),
                                        ]),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    // ]),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Work Experience",
                                              style: TextStyle(
                                                  color: Color(0xff3A3673),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 20)),
                                          // SizedBox(
                                          //   height: 30,
                                          // ),

                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _cardList.length,
                                              itemBuilder: (context,index){
                                                return _cardList[index];
                                              }),
                                          Row(children: [
                                            Expanded(child: SizedBox(width: 10,)),
                                            GestureDetector(
                                                onTap: (){
                                                  _addCardWidget();
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                )),],),
                                          Container(
                                              width: 400,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      Color.fromRGBO(
                                                          58, 54, 115, 1)),
                                                  onPressed: () {
                                                    // if (formGlobalKey.currentState.validate()) {
                                                    //   formGlobalKey.currentState.save();
                                                    //   // use the email provided here
                                                    // }
                                                    Navigator.pushNamed(context,
                                                        "/employee_home");
                                                  },
                                                  child: Text("Submit")))
                                        ]),
                                  ]))),
                    ),
                    Positioned(
                      top: 325,
                      left: -190,
                      child: Container(
                          width: 735,
                          height: 735,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                57, 54, 115, 0.07999999821186066),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(500, 500)),
                          )),
                    ),

                  ]),
                ])))));
  }
}
