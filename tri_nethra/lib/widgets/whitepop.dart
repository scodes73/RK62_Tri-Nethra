import 'package:flutter/material.dart';

// ignore: camel_case_types
class WhitePop extends StatelessWidget {
  final Widget child;

  const WhitePop({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(60),
        ),
      ),
      child: child,
    );
  }
}
