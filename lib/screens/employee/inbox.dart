import 'package:flutter/material.dart';
import 'package:join_re/widgets/footer.dart';
import 'package:join_re/widgets/header.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            Navigator.pushNamed(context, '/employee_home');
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: Header(),
            bottomNavigationBar: Footer(),
            body: SingleChildScrollView(
              child: Container(
                child: Center(child: Text("Chat")),
              ),
            )));
  }
}
