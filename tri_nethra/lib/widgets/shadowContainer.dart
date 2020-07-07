import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;

  const ShadowContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 0.0,
            spreadRadius: 2.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
