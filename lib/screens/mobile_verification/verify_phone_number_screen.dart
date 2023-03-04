import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:join_re/utils/helpers.dart';
import 'package:join_re/widgets/custom_loader.dart';
import 'package:join_re/widgets/pin_input_field.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        sendOtpOnInitialize: true,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          log(VerifyPhoneNumberScreen.id, msg: 'OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          log(
            VerifyPhoneNumberScreen.id,
            msg: autoVerified
                ? 'OTP was fetched automatically!'
                : 'OTP was verified manually!',
          );

          showSnackBar('Phone number verified successfully!');

          log(
            VerifyPhoneNumberScreen.id,
            msg: 'Login Success UID: ${userCredential.user?.uid}',
          );

          Navigator.pushReplacementNamed(context, "/email_success");
        },
        onLoginFailed: (authException, stackTrace) {
          log(
            VerifyPhoneNumberScreen.id,
            msg: authException.message,
            error: authException,
            stackTrace: stackTrace,
          );

          switch (authException.code) {
            case 'invalid-phone-number':
              // invalid phone number
              return showSnackBar('Invalid phone number!');
            case 'invalid-verification-code':
              // invalid otp entered
              return showSnackBar('The entered OTP is invalid!');
            // handle other error codes
            default:
              showSnackBar('Something went wrong!');
            // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          log(
            VerifyPhoneNumberScreen.id,
            error: error,
            stackTrace: stackTrace,
          );

          showSnackBar('An error occurred!');
        },
        builder: (context, controller) {
          return Scaffold(
              body:
                  Container(
                      width: MediaQuery.of(context).size.width,
                      // height: double.infinity,
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
                            height: 120,
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
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Rectangle.png'),
                                      fit: BoxFit.fitHeight),
                                ),
                              )),
                              Center(
                                  child: Container(
                                      alignment: Alignment.topCenter,
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/72785searching1.png'),
                                            fit: BoxFit.fitWidth),
                                      ))),
                            ],
                          ),
                          ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(20),
                              controller: scrollController,
                              children: [
                                const SizedBox(height: 15),
                                 PinInputField(
                                  length: 6,

                                  onFocusChange: (hasFocus) async {
                                    if (hasFocus)
                                      await _scrollToBottomOnKeyboardOpen();
                                  },
                                  onSubmit: (enteredOtp) async {
                                    final verified =
                                        await controller.verifyOtp(enteredOtp);
                                    if (verified) {
                                      Navigator.pushReplacementNamed(
                                          context, "/mobile_success");
                                      // number verify success
                                      // will call onLoginSuccess handler
                                    } else {
                                      // phone verification failed
                                      // will call onLoginFailed or onError callbacks with the error
                                    }
                                  },
                                ),
                              ]),

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
                          if (controller.codeSent)
                            TextButton(
                              onPressed: controller.isOtpExpired
                                  ? () async {
                                      log(VerifyPhoneNumberScreen.id,
                                          msg: 'Resend OTP');
                                      await controller.sendOTP();
                                    }
                                  : null,
                              child: Text(
                                controller.isOtpExpired
                                    ? 'Resend'
                                    : '${controller.otpExpirationTimeLeft.inSeconds}s',
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 18),
                              ),
                            ),
                        ])
                      ]))));
        },
      ),
    );
  }
}
