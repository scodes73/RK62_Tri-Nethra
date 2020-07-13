import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/ChatInterface/chatinterface.dart';
import 'package:tri_nethra/screens/ChatInterface/localWidgets/QAComponent.dart';
import 'package:tri_nethra/screens/TestScreens/testscreen.dart';
import 'package:tri_nethra/screens/home/home.dart';
import 'package:tri_nethra/screens/profile_page/profileui.dart';
//import 'package:tri_nethra/screens/ChatInterface/chatinterface.dart';
import 'package:tri_nethra/screens/root.dart';

// import 'package:tri_nethra/screens/login/login.dart';
// import 'package:tri_nethra/screens/signup/signup.dart';
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
        home: ChatScreen(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:tri_nethra/utils/wrapper.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Wrapper();
//   }
// }
