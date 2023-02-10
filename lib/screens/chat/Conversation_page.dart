import 'package:flutter/material.dart';
import 'package:join_re/screens/chat/widgets/ChatAppBar.dart';
import 'package:join_re/screens/chat/widgets/ChatListWidget.dart';
import 'package:join_re/screens/employee/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Stack(children: <Widget>[
              Column(
                children: <Widget>[
                  ChatAppBar(),

                  ChatListWidget(), //Chat list
                  InputWidget() // The input widget
                ],
              ),
            ]));
  }
}
