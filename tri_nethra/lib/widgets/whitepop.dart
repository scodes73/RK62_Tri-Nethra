import 'package:flutter/material.dart';

class whitepop extends StatelessWidget {
  final Widget child;

  const whitepop({Key key, this.child}) : super(key: key);
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
