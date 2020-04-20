import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysignup_app/signup_page.dart';

void main(List<String> args) {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  //   (_) {

  //   },
  // );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: page(),
    );
  }
}
