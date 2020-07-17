import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/root.dart';

class IssueFinal extends StatelessWidget {
  final ;
  IssueFinal({this.refno});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(refno),
            ),
            RaisedButton(
              child: Text('data'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => OurRoot(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
