import 'package:flutter/material.dart';
// ignore: use_key_in_widget_constructors
class AppliedJobList extends StatefulWidget {
  AppliedJobList(BuildContext context);

  @override
  State<StatefulWidget> createState() => AppliedJobListData();
}
class AppliedJobListData extends State<AppliedJobList> {

@override
  Widget build(BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width,
    height: 800,
    color: Colors.white,

);
}
}