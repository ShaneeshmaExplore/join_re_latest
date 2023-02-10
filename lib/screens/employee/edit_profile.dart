import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class EditProfile extends StatefulWidget {
  EditProfile(BuildContext context);

  @override
  State<StatefulWidget> createState() => EditProfileData();
}

class EditProfileData extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 1033,
          color: Colors.white,

        ));
  }
}
