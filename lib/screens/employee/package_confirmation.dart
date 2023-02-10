
import 'package:flutter/material.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:join_re/utils/constants/dimension.dart';
import 'package:join_re/utils/constants/string.dart';
import '../../utils/constants/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class PackageConfirmation extends StatefulWidget {

  final login;
  final  packages;
  const PackageConfirmation({Key? key, this.packages,this.login:''}) : super(key: key);

  @override
  State<PackageConfirmation> createState() => _PackageConfirmationState();
}

var password = TextEditingController();

final username = TextEditingController(text: '');
final formKey = GlobalKey<FormState>();
final objMainPageState = MainPage();

@override
class _PackageConfirmationState extends State<PackageConfirmation> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PackageConfirmation - FRAME

    return SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.18,
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
                    child: Row(
                      children: [
                        Container(
                            width: 117,
                            height: 117,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Vector_business_woman_character5901011.png'),
                                  fit: BoxFit.fitHeight),
                            )),
                        const Text(
                          'Selected Plan',
                          textAlign: TextAlign.center,
                          style: text24blue,
                        ),
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                        // bottomRight: Radius.circular(0),
                      ),
                      gradient: Linear_Gradient),
                  child: Column(children: [

                    Container(
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
                            height: 15,
                          ),
                          Text(
                            '${widget.packages['packages'][0]['plan']}',
                            style: text12blue,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Rs ${widget.packages['packages'][0]['amount']}/-',
                              style: text14blue),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.packages['packages'][0]['description']}',
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
                            'Rs ${widget.packages['packages'][0]['amount']}/-',
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
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainPage(pg: 4,login: widget.login,)),
                                    );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      alignment: Alignment.center,
                                      // width: 95,
                                      height: 30,
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
                                            'Change Your Plan',
                                            textAlign: TextAlign.center,
                                            style: text10white,
                                          ))),
                                )),
                              ])
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 155,
                      padding: EdgeInsets.fromLTRB(30,0,30,0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),

                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Terms and Conditions',
                          textAlign: TextAlign.left,
                          style: text20blue,
                        ),
                        children: <Widget>[
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. ',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text(
                            'Integer adipiscing ullamcorper sed condimentum ',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text(
                            'porttitor enim diam. Suspendisse vestibulum nascetur rutrum risus nisl nisl egestas egestas aliquam. Accumsan egestas euismod eget dolor. Ac blandit dolor eget convallis eu vel. Tortor semper pellentesque ullamcorper neque. Lacus dolor at hac consectetur. Odio vel tincidunt amet dui.',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text(
                            'Quis tellus non sodales metus in sed ut neque. Bibendum etiam egestas felis donec. Urna amet viverra urna pharetra pulvinar tincidunt orci donec quis. Eget amet egestas aliquam tincidunt lorem vestibulum diam. Nulla viverra facilisi feugiat',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text('')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 155,
                      padding: EdgeInsets.fromLTRB(30,0,30,0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),

                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Description',
                          textAlign: TextAlign.left,
                          style: text20blue,
                        ),
                        children: <Widget>[
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. Egestas suscipit nec tempus egestas viverra cras elementum faucibus. Ut amet vitae neque in eget non. Augue viverra sit a sit fermentum tempor non accumsan ac. Nunc nibh imperdiet non ipsum vitae volutpat etiam. Suspendisse pharetra pulvinar venenatis nunc quis. Sit sed ac egestas eget cras. Convallis lectus elementum faucibus tristique habitant arcu ornare faucibus aliquet. Sit diam ornare arcu consequat fringilla tincidunt lectus. Leo amet est eget urna posuere scelerisque. Euismod integer facilisis tellus non. Sapien magna urna sollicitudin in id. Habitant viverra gravida tempor fames id egestas.',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text(
                            'At nibh diam ullamcorper mi. Mauris et cursus nec risus malesuada. Scelerisque bibendum quam sed ut. Tristique odio eget sit vel vitae odio amet. Eros nunc et cursus lorem posuere egestas eleifend lacus etiam. Sagittis in elementum sed diam. Mauris felis bibendum maecenas morbi in rhoncus et. Scelerisque quam vulputate porttitor consequat quam.',
                            textAlign: TextAlign.left,
                            style: text10blue,
                          ),
                          Text('')

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainPage(pg: 4,login: widget.login,)),
                              );
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 95,
                                height: 30,
                                decoration: const BoxDecoration(
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
                                  color: Color.fromRGBO(236, 37, 90, 1.0),
                                ),
                                child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Cancel',
                                      textAlign: TextAlign.center,
                                      style: text10white,
                                    ))),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Razorpay razorpay = Razorpay();
                              var options = {
                                'key': 'rzp_test_qP5nDSssYRMPRD',
                                'amount': 100,
                                'name': 'JoinRe', 
                                'description': '',
                                'retry': {'enabled': true, 'max_count': 1},
                                'send_sms_hash': true,
                                'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                                'external': {
                                  'wallets': ['paytm']
                                }
                              };
                              razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                              razorpay.open(options);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 95,
                                height: 30,
                                decoration: container_box_decoration_green,
                                child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Proceed',
                                      textAlign: TextAlign.center,
                                      style: text10white,
                                    ))),
                          ),
                          SizedBox(width: 10),
                        ]),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
                )
              ],
            )));
  }


void handlePaymentErrorResponse(PaymentFailureResponse response){
  /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
}

void handlePaymentSuccessResponse(PaymentSuccessResponse response){
  /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
  showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
}

void handleExternalWalletSelected(ExternalWalletResponse response){
  showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
}

void showAlertDialog(BuildContext context, String title, String message){
  // set up the buttons
  Widget continueButton = ElevatedButton(
    child: const Text("Continue"),
    onPressed:  () {},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
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
}