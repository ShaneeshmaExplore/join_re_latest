import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/password_reset_success.dart';
import 'package:join_re/utils/api.dart';

class ChangePassword extends StatefulWidget {
  @override
  final int id;
  const ChangePassword({Key? key, required this.id}) : super(key: key);
  _ChangePasswordState createState() => _ChangePasswordState();
}

var password = TextEditingController();

final username = TextEditingController(text: '');
final formKey = GlobalKey<FormState>();

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Genera

    return AlertDialog(
        content: Container(
            padding: const EdgeInsets.all(5),
            height: 240,
            child: Column(children: <Widget>[
              Container(
                  alignment:
                  Alignment.centerRight,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                            'CHANGE PASSWORD',
                            textAlign:
                            TextAlign.center,
                            style: TextStyle(
                                color: Color
                                    .fromRGBO(58,
                                    54, 115, 1),
                                fontFamily:
                                'Open Sans',
                                fontSize: 14,
                                letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight:
                                FontWeight
                                    .bold,
                                height: 1.25),
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(
                                context)
                                .pop();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration:
                            const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Close.png'),
                                  fit: BoxFit
                                      .fitWidth),
                            ),
                          ))
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Colors.grey,
                textInputAction:
                TextInputAction.next,
                maxLines: 1,
                controller: username,
                validator: (value) {
                  return null;
                },
                decoration:
                const InputDecoration(
                  isDense: true,
                  labelText: 'New password',
                ),
                obscureText: true,
                // NOT OK
                obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                cursorColor: Colors.grey,
                controller: password,
                textInputAction:
                TextInputAction.next,
                decoration:
                const InputDecoration(
                  isDense: true,
                  labelText:
                  'Confirm password',
                ),
                obscureText: true,
                // NOT OK
                obscuringCharacter: '*',
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  _change_password(widget.id,password.text);

                },
                child: Container(
                    width: 113,
                    height: 30,
                    decoration:
                    const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(
                        topLeft:
                        Radius.circular(
                            5),
                        topRight:
                        Radius.circular(
                            5),
                        bottomLeft:
                        Radius.circular(
                            5),
                        bottomRight:
                        Radius.circular(
                            5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color
                                .fromRGBO(
                                0,
                                0,
                                0,
                                0.25),
                            offset:
                            Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(
                          58, 54, 115, 1),
                    ),
                    child: const Padding(
                        padding:
                        EdgeInsets.all(7),
                        child: Text(
                          'Save',
                          textAlign: TextAlign
                              .center,
                          style: TextStyle(
                              color: Color
                                  .fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1),
                              fontFamily:
                              'Roboto',
                              fontSize: 16,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight:
                              FontWeight
                                  .normal,
                              height: 1),
                        ))),
              )
            ])));
  }

  Future _change_password(id,pass) async {
    print(pass);
    var data = {
      "id": id,
      "password":pass
    };
    var res = await Network().authData(data, '/change_password');
    if(res.statusCode == 200){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext
          context) {
            return PasswordResetSuccess();
          });
    }

  }

}
