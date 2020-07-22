//testing
import 'package:flutter/material.dart';

class Te extends StatelessWidget {
  final String a;
  Te({this.a});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(a),
      ),
    );
  }
}
