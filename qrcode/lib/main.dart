import 'package:flutter/material.dart';

import 'package:qrcode/screens/login_screen.dart';

import 'homepage.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  //theme: ThemeData(primaryColor: Colors.green),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
