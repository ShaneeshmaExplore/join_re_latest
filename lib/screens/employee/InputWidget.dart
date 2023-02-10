import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            // ignore: unnecessary_new
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              // child: IconButton(
              //   icon: new Icon(Icons.face),
              //   color: Color.fromRGBO(58, 54, 115, 1),
              // ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(
                    color: Color.fromRGBO(58, 54, 115, 1), fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Color.fromRGBO(58, 54, 115, 1)),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: Image(
                  width: 30,
                  image: AssetImage('assets/images/Emailsend.png'),
                ),
                onPressed: () => {},
                color: Color.fromRGBO(58, 54, 115, 1),
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(
                  color: Color.fromRGBO(58, 54, 115, 1), width: 0.5)),
          color: Colors.white),
    );
  }
}
