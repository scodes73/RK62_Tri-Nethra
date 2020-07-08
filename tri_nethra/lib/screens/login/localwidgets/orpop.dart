import 'package:flutter/material.dart';

class OrPop extends StatelessWidget {
  final Widget child;

  const OrPop({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(225, 95, 27, .3),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: child,
    );
  }
}
