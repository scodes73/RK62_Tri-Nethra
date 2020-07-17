import 'package:flutter/material.dart';
import 'package:tri_nethra/services/location/location.dart';
import 'package:tri_nethra/services/location/picker_page.dart';

class LScreenPage extends StatefulWidget {
  @override
  _LScreenPageState createState() => _LScreenPageState();
}

class _LScreenPageState extends State<LScreenPage> {
  double _lat = 0, _lng = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LScreen Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  Location location = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPickerPage()),
                  );
                  if (location != null) {
                    setState(() {
                      _lat = location.lat;
                      _lng = location.lng;
                    });
                  }
                },
                child: Text(
                  'Picker Location',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '$_lat, $_lng',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
