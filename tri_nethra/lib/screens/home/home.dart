import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/root.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () async {
          CurrentUser _currentUser =
              Provider.of<CurrentUser>(context, listen: false);
          String _returnString = await _currentUser.signOut();
          if (_returnString == "success") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => OurRoot(),
              ),
              (route) => false,
            );
          }
        }),
      ),
      appBar: AppBar(
        title: Text('data'),
      ),
    );
  }
}
