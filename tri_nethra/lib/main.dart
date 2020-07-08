import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/login.dart';
import 'package:tri_nethra/screens/signup/signup.dart';
import 'package:tri_nethra/utils/ourTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OurTheme().buildTheme(),
      home: OurLogin(),
    );
  }
}
