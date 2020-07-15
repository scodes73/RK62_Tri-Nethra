import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/TestScreens/testscreen.dart';
import 'package:tri_nethra/screens/home/home.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/utils/ourTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Question a = Question();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
      ),
    );
  }
}
