import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/employee_home.dart';
import 'package:join_re/screens/employee/popup/add_photo_widgets.dart';
import 'package:join_re/screens/employee/popup/add_video.dart';
import 'package:join_re/screens/employee/popup/cv_color.dart';
import 'package:join_re/screens/employee/preview_page.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:printing/printing.dart';
import '../../utils/constants/colors.dart';

class ViewProfile extends StatefulWidget {
  final id;
  final data;
  const ViewProfile({Key? key, required this.id, required this.data})
      : super(key: key);
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

var netImage;

class _ViewProfileState extends State<ViewProfile> {

  @override
  Widget build(BuildContext context) {
    widget.data == null
        ? Center(child: CircularProgressIndicator())
        : ((widget.data['user']['profile_img'] != null)
            ? netImage = Container(
                alignment: Alignment.topCenter,
                width: 44,
                height: 44.494380950927734,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.elliptical(44, 44.494380950927734)),
                ),
                child: Image.network(
                  widget.data['user']['profile_img'],
                  fit: BoxFit.fill,
                ))
            : netImage = Container(
                alignment: Alignment.topCenter,
                width: 44,
                height: 44.494380950927734,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Ellipse4.png'),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.all(
                      Radius.elliptical(44, 44.494380950927734)),
                )));
    print(netImage);
    return SingleChildScrollView(
        child: widget.data == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0 && details.delta.dy == 0) {
                      // Navigator.pushNamed(context, '/employee_home');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmployeeHome(
                              name: widget.data['user']['name'],
                              id: widget.data['user']['id']),
                        ),
                      );
                    }
                  },
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.14,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      child: Column(children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CVColor(id: widget.id);
                                      });
                                },
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Downloadingupdates.png'),
                                          fit: BoxFit.fitWidth),
                                    ))),
                            Expanded(child: Container()),
                            GestureDetector(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddPhotoWidget(
                                            id: widget.id, profile_img: "true");
                                      });
                                },
                                child: netImage),
                            Expanded(child: Container()),
                            GestureDetector(
                                onTap: () {
                                  widget.data == null
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                PreviewPage(data: widget.data),
                                          ),
                                        );
                                },
                                child: Container(
                                    alignment: Alignment.topRight,
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Edit.png'),
                                          fit: BoxFit.none),
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.data['user']['name']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          // 'UI Designer | Front-End Developer',
                          '${widget.data['work_exp'][0]['occupation_position_held'] ?? ''}',

                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              fontFamily: 'Open Sans',
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
                          // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Senectus mauris a vestibulum nunc. Dui faucibus ',
                          '${widget.data['work_exp'][0]['activities_responsibilities'] ?? ''}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(58, 54, 115, 1),
                              fontFamily: 'Open Sans',
                              fontSize: 10,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )
                      ]),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.94595,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(0),
                            // bottomRight: Radius.circular(0),
                          ),
                          gradient: Linear_Gradient),
                      child: Column(children: [
                        // Row(children: [
                        InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            splashColor: Colors.black12,
                            // child: Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 116,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                width: 158,
                                height: 116,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(4, 4),
                                        blurRadius: 4)
                                  ],
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(58, 54, 115, 1),
                                    width: 0.5,
                                  ),
                                ),
                                /*Basic Info*/
                                child: Column(children: [
                                  Row(children: [
                                    Expanded(
                                        child:
                                        Text(
                                      'Basic details',
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
                              ),
                                    GestureDetector(
                                        onTap: () {
                                          widget.data == null
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) => PreviewPage(
                                                        data: widget.data),
                                                  ),
                                                );
                                        },
                                        child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Edit.png'),
                                                  fit: BoxFit.fitWidth),
                                            )))
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Shoppingbag.png'),
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        // 'Experience',
                                        '${widget.data['work_exp'][0]['occupation_position_held']}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(58, 54, 115, 1),
                                            fontFamily: 'Open Sans',
                                            fontSize: 10,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 12,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Location.png'),
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      // 'Location',
                                      '${widget.data['education'][0]['edu_address']}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 12,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Account.png'),
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.data['user']['dob']}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 12,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Mail.png'),
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.data['user']['email']}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Container(
                                      width: 12,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Phone.png'),
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.data['user']['mobile']}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ]),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            splashColor: Colors.black12,
                            // child: Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 85,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                width: 158,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(4, 4),
                                        blurRadius: 4)
                                  ],
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(58, 54, 115, 1),
                                    width: 0.5,
                                  ),
                                ),
                                child: Column(children: [
                                  Row(children: [
                                    Expanded(
                                        child:
                                        Text(
                                      'Education',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PreviewPage(
                                                  data: widget.data),
                                            ),
                                          );
                                        },
                                        child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Edit.png'),
                                                  fit: BoxFit.fitWidth),
                                            )))
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Row(children: [
                                  widget.data == null
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Expanded(child
                                      :ListView.builder(
                                          // itemCount: models.length,
                                          itemCount:
                                              widget.data['education'].length ??
                                                  0,
                                          itemBuilder: (context, index) => Card(
                                            elevation: 0.0,
                                                child:

                                                Text(
                                                  '${widget.data['education'][index]['title_of_qualification']}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(58, 54, 115, 1),
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 10,
                                                      letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight: FontWeight.normal,
                                                      height: 1),
                                                )),
                                              )
                            )
                                ]),
                              ),
                            )),
                        // ]),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            splashColor: Colors.black12,
                            // child: Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 85,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                width: 158,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  boxShadow: [
                                    const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(4, 4),
                                        blurRadius: 4)
                                  ],
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(58, 54, 115, 1),
                                    width: 0.5,
                                  ),
                                ),
                                child: Column(children: [
                                  Row(children: [
                                    Expanded(
                                        child:
                                        Text(
                                      'Work Experience',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(58, 54, 115, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    )),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PreviewPage(
                                                  data: widget.data),
                                            ),
                                          );
                                        },
                                        child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Edit.png'),
                                                  fit: BoxFit.fitWidth),
                                            )))
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  widget.data == null
                                      ? Center(
                                      child: CircularProgressIndicator())
                                      :Expanded(child: ListView.builder(
                                    // itemCount: models.length,
                                      itemCount:
                                      widget.data['work_exp'].length ??
                                          0,
                                      itemBuilder: (context, index) => Card(
                                        elevation: 0.0,
                                        child:
                                        // Column(children: [
                                          Text(
                                            // 'Graduation in Engineering from Calicut University',
                                            '${widget.data['work_exp'][index]['occupation_position_held']}',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    58, 54, 115, 1),
                                                fontFamily: 'Open Sans',
                                                fontSize: 10,
                                                letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight:
                                                FontWeight.normal,
                                                height: 1),
                                          ),
                                        //   SizedBox(
                                        //     height: 5,
                                        //   ),
                                        // ]),
                                      )))


                                ]),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          Container(
                              alignment: Alignment.center,
                              width: 169,
                              height: 87,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(58, 54, 115, 1),
                                  width: 0.5,
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Unsplashz9fw8nn7d24.png'),
                                    fit: BoxFit.fitWidth),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 145,
                                  height: 25,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: Offset(0, 4),
                                          blurRadius: 4)
                                    ],
                                    color: Color.fromRGBO(236, 37, 90, 1),
                                  ),
                                  child: Text(
                                    'Record now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 10,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    AddVideo(id: widget.id);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    width: 145,
                                    height: 25,
                                    decoration: BoxDecoration(
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
                                      border: Border.all(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      'Upload Video',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ))
                            ],
                          ))
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            'Gallary',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )
                        ]),
                        SizedBox(
                          height: 10,
                        ),

                        Row(children: [
                          Expanded(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Container(
                                    width: 91,
                                    height: 79,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Unsplashbbuxnokl2uk.png'),
                                          fit: BoxFit.fill),
                                    )),
                                SizedBox(
                                  width: 23,
                                ),
                                Container(
                                    width: 91,
                                    height: 79,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Unsplashbbuxnokl2uk.png'),
                                          fit: BoxFit.fill),
                                    )),
                                SizedBox(
                                  width: 23,
                                ),
                                Container(
                                    width: 91,
                                    height: 79,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Unsplashbbuxnokl2uk.png'),
                                          fit: BoxFit.fill),
                                    )),
                              ])),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Standard Plan',
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
                                height: 10,
                              ),
                              Text(
                                '\$1000',
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
                                height: 10,
                              ),
                              Text(
                                'For Female and Transgenders 50% Off',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(58, 54, 115, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 10,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$1000',
                                style: TextStyle(
                                    color: Color.fromRGBO(58, 54, 115, 1),
                                    fontFamily: 'Open Sans',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1.25),
                              ),
                              SizedBox(height: 10),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainPage(pg: 5)),
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
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.25),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 4)
                                            ],
                                            color:
                                                Color.fromRGBO(58, 54, 115, 1),
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainPage(pg: 5)),
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
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.25),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 4)
                                            ],
                                            color:
                                                Color.fromRGBO(170, 197, 1, 1),
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              ))),
                                    ),
                                    SizedBox(width: 10),
                                  ])
                            ],
                          ),
                        ),
                      ]),
                    )
                  ]),
                )));
  }
}
