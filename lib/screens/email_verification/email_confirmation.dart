import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailConfirmation extends StatefulWidget {
  @override
  _EmailConfirmationState createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  @override
  late FocusNode myFocusNode2;
  late FocusNode myFocusNode3;
  late FocusNode myFocusNode4;

  @override
  void initState() {
    super.initState();

    myFocusNode2 = FocusNode();
    myFocusNode3 = FocusNode();
    myFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode2.dispose();
    myFocusNode3.dispose();
    myFocusNode4.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child:SingleChildScrollView(child: Stack(children: <Widget>[

              Container(
                  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-60,
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
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
                  ),
              ),
              Column(children: [
                SizedBox(
                  height: 180,
                ),
                Text("Enter OTP Number",
                    style: TextStyle(
                        color: Color(0xff3A3673),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        fontSize: 20)),
                Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(child:
                Container(
                  alignment: Alignment.bottomCenter,
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/lap.png'),
                            fit: BoxFit.fitWidth),
                      ),
                )), Center(child:
                  Container(
                      alignment: Alignment.topCenter,
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/72785searching1.png'),
                            fit: BoxFit.fitWidth),
                      )),
                     ),
                ],),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                      width: 51,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(58, 54, 115, 1),
                          width: 1,
                        ),
                      ),

                    child: TextFormField(
                      onChanged: (text) => myFocusNode2.requestFocus(),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      initialValue: null,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 20,
                          color: Color(0xff3A3673),
                          fontFamily: 'Open Sans'),
                    ),


                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 51,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(58, 54, 115, 1),
                        width: 1,
                      ),
                    ),  child: TextFormField(
                    onChanged: (text) => myFocusNode3.requestFocus(),
                    focusNode: myFocusNode2,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    initialValue: null,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 20,
                        color: Color(0xff3A3673),
                        fontFamily: 'Open Sans'),
                  ),
                  ),
                    SizedBox(width: 10,),

                  Container(
                    width: 51,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(58, 54, 115, 1),
                        width: 1,
                      ),
                    ),  child: TextFormField(
                    onChanged: (text) => myFocusNode4.requestFocus(),
                    focusNode: myFocusNode3,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    initialValue: null,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 20,
                        color: Color(0xff3A3673),
                        fontFamily: 'Open Sans'),
                  ),
                  ),
                    SizedBox(width: 10,),
                  Container(
                    width: 51,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(58, 54, 115, 1),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      // onChanged: (text) => myFocusNode4.requestFocus(),
                      focusNode: myFocusNode4,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      initialValue: null,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 20,
                          color: Color(0xff3A3673),
                          fontFamily: 'Open Sans'),
                    ),
                  )
                ],),
                SizedBox(height: 30,),
                Text(
                    'example@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                Container(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:
                            Color.fromRGBO(58, 54, 115, 1)),
                        onPressed: () {
                          // if (formGlobalKey.currentState.validate()) {
                          //   formGlobalKey.currentState.save();
                          //   // use the email provided here
                          // }
                          Navigator.pushReplacementNamed(
                              context, "/email_success");
                        },
                        child: Text("Submit")))

              ])
            ]))));
  }
}
