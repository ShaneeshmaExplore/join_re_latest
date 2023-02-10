import 'package:flutter/material.dart';

const commonPadding = 8.0;

const container_box_decoration_green =  const BoxDecoration(
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
  color: Color.fromRGBO(170, 197, 1, 1),
);

const TextStyle welcomeTextStyle = TextStyle(
                                        color: Colors.white,
                                        // backgroundColor: Color.fromRGBO(58, 54, 115, 1),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1);
