import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/root.dart';

class IssueFinal extends StatefulWidget {
  // final String refno='';
  // IssueFinal({this.refno});
  @override
  _IssueFinalState createState() => _IssueFinalState();
}

class _IssueFinalState extends State<IssueFinal> {
  Widget te(context) {
    try {
      CurrentUser _currentUser =
          Provider.of<CurrentUser>(context, listen: false);
      print(_currentUser.getCurrentUser.refId);
      return Text(
        _currentUser.getCurrentUser.refId.last,
        style: TextStyle(color: Colors.white),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              child: Text('data'),
              onPressed: () {
                setState(() {
                  CurrentUser _currentUser =
                      Provider.of<CurrentUser>(context, listen: false);
                  print(_currentUser.getCurrentUser.refId);
                });

                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => OurRoot(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
