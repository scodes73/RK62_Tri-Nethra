import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocCurr extends StatefulWidget {
  @override
  _LocCurrState createState() => _LocCurrState();
}

class _LocCurrState extends State<LocCurr> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(title: Text("Location Services")),
            body: Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_locationMessage),
                    FlatButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        color: Colors.green,
                        child: Text("Find Location"))
                  ]),
            )));
  }
}
