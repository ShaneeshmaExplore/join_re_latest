import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

// ignore: use_key_in_widget_constructors
class AppliedSuccess extends StatefulWidget {
  AppliedSuccess(BuildContext context);

  @override
  State<StatefulWidget> createState() => AppliedSuccessData();
}
class AppliedSuccessData extends State<AppliedSuccess> {

@override
  Widget build(BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width,
    height: 800,
    color: Colors.white,

);
}
}