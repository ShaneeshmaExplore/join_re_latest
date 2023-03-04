import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_otp/email_otp.dart';

class EmailConfirmation extends StatefulWidget {
  final email;
  const EmailConfirmation({Key? key, this.email}) : super(key: key);
  @override
  _EmailConfirmationState createState() => _EmailConfirmationState();
}

var text1 = TextEditingController();
var text2 = TextEditingController();
var text3 = TextEditingController();
var text4 = TextEditingController();
EmailOTP myauth = EmailOTP();

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
    sendotp();
  }

  sendotp() async {
    myauth.setConfig(
        // appEmail: "shaneeshma@exploreitsolutions.com",
        appEmail: "me@rohitchouhan.com",
        appName: "Email OTP",
        userEmail: widget.email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
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
            child: SingleChildScrollView(
                child: Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 60,
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
                    Center(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/lap.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    )),
                    Center(
                      child: Container(
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
                  ],
                ),
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
                        controller: text1,
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
                    SizedBox(
                      width: 10,
                    ),
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
                        controller: text2,
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
                    SizedBox(
                      width: 10,
                    ),
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
                        controller: text3,
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
                    SizedBox(
                      width: 10,
                    ),
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
                        controller: text4,

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
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
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
                            backgroundColor: Color.fromRGBO(58, 54, 115, 1)),
                        onPressed: () async {
                          // if (formGlobalKey.currentState.validate()) {
                          //   formGlobalKey.currentState.save();
                          //   // use the email provided here
                          // }
                          var inputOTP = text1.text +
                              text2.text +
                              text3.text +
                              text4
                                  .text; //which is entered by client, after receive mail
                          bool res = await myauth.verifyOTP(otp: inputOTP);
                          if (res == true) {
                            Navigator.pushReplacementNamed(
                                context, "/email_success");
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP verification failed"),
                            ));
                          }
                        },
                        child: Text("Submit")))
              ])
            ]))));
  }
}
