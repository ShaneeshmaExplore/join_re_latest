// Tip: tap on the down arrow to format the code.

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:join_re/utils/routes.dart';
import 'package:flutter/services.dart';
import 'widgets/logo_first.dart';
import 'package:join_re/utils/route_generator.dart';

// void main() => runApp(const MyWidget());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  FirebasePhoneAuthProvider(
        child:MaterialApp(
      title: 'Join-Re',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LogoFirst(),
        // home: SampleScreen(),
      routes:route,
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

  }
}
