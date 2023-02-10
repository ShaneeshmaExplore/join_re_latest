import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/company/post_job_success.dart';
import 'package:join_re/screens/main_page_employer.dart';
import 'package:join_re/utils/api.dart';

class EmployerHome extends StatefulWidget {
  final emp_pg;
  final login_id;
  final arrData;
  final arrPostedJob;
  const EmployerHome({Key? key, this.login_id, this.emp_pg, this.arrData,this.arrPostedJob})
      : super(key: key);

  @override
  State<EmployerHome> createState() => _EmployerHomeState();
}

var selectedPage;

var job_title = TextEditingController();
var skills_needed = TextEditingController();
var year_of_exp_needed = TextEditingController();
var about_the_job = TextEditingController();
var other_details = TextEditingController();
var id = TextEditingController();

class _EmployerHomeState extends State<EmployerHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedPage = widget.emp_pg;
    });
  }

  void showAlertDialog(BuildContext context, String title, String message, int id){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Yes"),
      onPressed:  () {
        _delete_posted_job(id);
      },
    );
    Widget cancelButton = ElevatedButton(
      child: const Text("No"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _delete_posted_job(id) async{
  setState(() {
    _isLoading = true;
  });
  var data = {
    "id":id,
  };

  var res = await Network().authData(data, '/delete_posted_job');
  var body = json.decode(res.body);
  print(body);
  if (body['success']) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPageEmployer(pg: 1,login:widget.login_id)),
    );
  }

}
void  get_posted_job(id) async{
  setState(() {
    _isLoading = true;
  });
  var data = {
    "id":id,
  };

  var res = await Network().authData(data, '/get_posted_job');
  var body = json.decode(res.body);
  print(body);
  if (body['success']) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPageEmployer(pg: 0,login:widget.login_id)),
    );
  }

}
  void _post_job() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      // "id":widget.arrData['id'],
      "user_id": widget.login_id[1],
      "job_title": job_title.text,
      "skills_needed": skills_needed.text,
      "year_of_exp_needed": year_of_exp_needed.text,
      "about_the_job": about_the_job.text,
      "other_details": other_details.text,
      "status": "Active"
    };

    var res = await Network().authData(data, '/post_job');
    var body = json.decode(res.body);
    if (body['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostJobSuccess(login_id: widget.login_id)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.arrPostedJob) {
    //   job_title = widget.arrPostedJob['job_title']??'';
    // }
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: DefaultTabController(
            initialIndex: selectedPage,
            length: 2,
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 154.1705322265625,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/employer_home.png'),
                            fit: BoxFit.fitWidth),
                      ),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(0),
                              // bottomRight: Radius.circular(0),
                            ),
                          ))),
                  TabBar(
                    // unselectedLabelColor: Colors.black,
                    // labelColor: Colors.red,
                    tabs: [
                      new Text(
                        'Post Jobs',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(58, 54, 115, 1),
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                      new Text(
                        'Posted Jobs',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(58, 54, 115, 1),
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    SingleChildScrollView(
                        child: new Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(

                                    // initialValue: '${widget.arrPostedJob['job_title']??''}',
                                    controller: job_title,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Job Title';
                                      }
                                      // job_title = value;

                                      return null;
                                    },
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                    decoration: InputDecoration(
                                      // border: Outline(),
                                      labelText: 'Job Title',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: skills_needed,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter skills needed';
                                      }
                                      // skills_needed = value;
                                      return null;
                                    },
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                    decoration: InputDecoration(
                                      // border: Outline(),
                                      labelText: 'Skills Needed',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: year_of_exp_needed,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Year of experience needed';
                                      }
                                      // year_of_exp_needed = value;
                                      return null;
                                    },
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                    decoration: InputDecoration(
                                      // border: Outline(),
                                      labelText: 'Year of Experience Needed',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: about_the_job,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter something about this job';
                                      }
                                      // about_the_job = value;
                                      return null;
                                    },
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                    decoration: InputDecoration(
                                      // border: Outline(),
                                      labelText: 'About this Job',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: other_details,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter other details';
                                      }
                                      // other_details = value;
                                      return null;
                                    },
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff3A3673),
                                        fontFamily: 'Open Sans'),
                                    decoration: InputDecoration(
                                      // border: Outline(),
                                      labelText: 'Other Details',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                      width: 400,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  58, 54, 115, 1)),
                                          onPressed: () {
                                            // if (formGlobalKey.currentState.validate()) {
                                            //   formGlobalKey.currentState.save();
                                            //   // use the email provided here
                                            // }
                                            _post_job();
                                          },
                                          child: Text("Post Job")))
                                ])),
                      ],
                    )),
                    Expanded(
                        child:  ListView.builder(
                            // itemCount: models.length,
                          itemCount: widget.arrData['count']??0,
                            itemBuilder: (context, index) => Card(
                                child:  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 333,
                                    height: 99,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: Color.fromRGBO(58, 54, 115, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(58, 54, 115, 1),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Column(children: [
                                      Row(children: [
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/google.png'),
                                                            fit: BoxFit.fitWidth),
                                                      )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${widget.arrData['posted_jobs'][index]['job_title']}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                        Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.normal,
                                                        height: 1),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${widget.arrData['posted_jobs'][index]['skills_needed']??''}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                        Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.normal,
                                                        height: 1),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${widget.arrData['posted_jobs'][index]['about_the_job']??''}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                        Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 6,
                                                        letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.normal,
                                                        height: 1),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),

                                                  Text(
                                                    '${widget.arrData['posted_jobs'][index]['days']??0} days ago',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                        Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight: FontWeight.normal,
                                                        height: 1),
                                                  )
                                                ])),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        get_posted_job(widget.arrData['posted_jobs'][index]['job_title']);

                                                      },
                                                      child: Container(
                                                          width: 14,
                                                          height: 14,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/Edit_white.png'),
                                                                fit: BoxFit.fitWidth),
                                                          ))),
                                                  SizedBox(
                                                    height: 50,
                                                  ),
                                GestureDetector(
                                    onTap: () {
                                      showAlertDialog(context, "Delete Confirmation", "Are you sure to delete?",widget.arrData['posted_jobs'][index]['id']);
                                      // get_posted_job(widget.arrData['posted_jobs'][index]['job_title']);

                                    },
                                    child:
                                                  Container(
                                                      width: 14,
                                                      height: 14,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Remove.png'),
                                                            fit: BoxFit.fitWidth),
                                                      )))
                                                ]))
                                      ])
                                    ]))
                            )))
                  ]))
                ]))));
  }

}
