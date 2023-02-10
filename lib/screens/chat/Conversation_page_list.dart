import 'package:flutter/material.dart';
import 'package:join_re/screens/chat/Conversation_page.dart';

class ConversationPageList extends StatefulWidget {
  const ConversationPageList({super.key});

  @override
  _ConversationPageListState createState() => _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ConversationPage(),
        // ConversationPage(),
        // ConversationPage()
      ],
    );
  }
}
