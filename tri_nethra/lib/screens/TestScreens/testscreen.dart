//Testing
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/ChatInterface/ChatScreen2.dart';
import 'package:tri_nethra/services/database.dart';

class testiss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Center(
              child: InkWell(
        child: Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () async {
          try {
            CurrentUser _currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            print(_currentUser.getCurrentUser.uid);
            String _returnString = await OurDatabase().createIssue(
                _currentUser.getCurrentUser.uid,
                ['al1', 'al2', 'al3'],
                ['fl1', 'fl2', 'fl3'],
                ['ll1', 'll2']);
            if (_returnString == "success") {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            } else {
              print(_returnString);
            }
          } catch (e) {
            print(e);
          }
        },
      ))),
    );
  }
}
