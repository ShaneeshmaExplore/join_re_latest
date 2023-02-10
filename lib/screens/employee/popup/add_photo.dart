import 'package:flutter/material.dart';
import 'package:join_re/screens/employee/popup/add_photo_widgets.dart';


//import http package manually
class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
        content: Container(
            padding: const EdgeInsets.all(5),
            height: 250,
            child: Column(children: <Widget>[
              Container(
                  alignment:
                  Alignment.centerRight,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                            'Upload to Gallery',
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
                            alignment: Alignment.topRight,
                            width: 20,
                            height: 20,
                            decoration:
                            const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Close.png'),
                                  fit: BoxFit
                                      .fitHeight),
                            ),
                          ))
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          width: 91,
                          height: 79,
                          decoration:
                          BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/Unsplashk8hnyh5ymz8.png'),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            const BorderRadius
                                .only(
                              topLeft: Radius
                                  .circular(
                                  5),
                              topRight: Radius
                                  .circular(
                                  5),
                              bottomLeft: Radius
                                  .circular(
                                  5),
                              bottomRight:
                              Radius
                                  .circular(
                                  5),
                            ),
                            border:
                            Border.all(
                              color: const Color
                                  .fromRGBO(
                                  58,
                                  54,
                                  115,
                                  1),
                              width: 0.5,
                            ),
                          ))),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                          width: 91,
                          height: 79,
                          decoration:
                          BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/Unsplashk8hnyh5ymz8.png'),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            const BorderRadius
                                .only(
                              topLeft: Radius
                                  .circular(
                                  5),
                              topRight: Radius
                                  .circular(
                                  5),
                              bottomLeft: Radius
                                  .circular(
                                  5),
                              bottomRight:
                              Radius
                                  .circular(
                                  5),
                            ),
                            border:
                            Border.all(
                              color: const Color
                                  .fromRGBO(
                                  58,
                                  54,
                                  115,
                                  1),
                              width: 0.5,
                            ),
                          ))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          width: 91,
                          height: 79,
                          decoration:
                          BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/Unsplashk8hnyh5ymz8.png'),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            const BorderRadius
                                .only(
                              topLeft: Radius
                                  .circular(
                                  5),
                              topRight: Radius
                                  .circular(
                                  5),
                              bottomLeft: Radius
                                  .circular(
                                  5),
                              bottomRight:
                              Radius
                                  .circular(
                                  5),
                            ),
                            border:
                            Border.all(
                              color: const Color
                                  .fromRGBO(
                                  58,
                                  54,
                                  115,
                                  1),
                              width: 0.5,
                            ),
                          ))),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                          width: 91,
                          height: 79,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            const BorderRadius
                                .only(
                              topLeft: Radius
                                  .circular(
                                  5),
                              topRight: Radius
                                  .circular(
                                  5),
                              bottomLeft: Radius
                                  .circular(
                                  5),
                              bottomRight:
                              Radius
                                  .circular(
                                  5),
                            ),
                            border:
                            Border.all(
                              color: const Color
                                  .fromRGBO(
                                  58,
                                  54,
                                  115,
                                  1),
                              width: 1,
                            ),
                          ),
                          child: GestureDetector(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddPhotoWidgets();
                                    });
                              },
                              child: Container(
                              width: 48,
                              height: 48,
                              decoration:
                              const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Addimage.png'),
                                    fit: BoxFit
                                        .none),
                              ))))),
                ],
              )
            ])));
    throw UnimplementedError();
  }

}






