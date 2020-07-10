import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/home/home.dart';
import 'package:tri_nethra/screens/login/login.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  String currentUid;
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //get the state, check current User, set AuthStatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();
    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = OurLogin();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}

// class LoggedIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     UserModel _userStream = Provider.of<UserModel>(context);
//     Widget retVal;
//     if (_userStream != null) {
//       if (_userStream.groupId != null) {
//         retVal = StreamProvider<GroupModel>.value(
//           value: DBStream().getCurrentGroup(_userStream.groupId),
//           child: InGroup(),
//         );
//       } else {
//         retVal = NoGroup();
//       }
//     } else {
//       retVal = SplashScreen();
//     }

//     return retVal;
//   }
// }
