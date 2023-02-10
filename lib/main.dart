// Tip: tap on the down arrow to format the code.

import 'package:flutter/material.dart';
import 'package:join_re/utils/routes.dart';
import 'package:flutter/services.dart';
import 'widgets/logo_first.dart';
void main() => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Join-Re',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LogoFirst(),
        // home: SampleScreen(),
      routes:route);

  }
}
