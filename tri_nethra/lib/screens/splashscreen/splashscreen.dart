import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OurSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.orange[900],
                Colors.orange[300],
                Colors.orange[200]
              ])),
          child: Container(
            child: Center(
                child: SpinKitWave(
              size: 80,
              color: Colors.white,
            )),
          ));
    }));
  }
}
