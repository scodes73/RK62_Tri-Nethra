import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tri_nethra/screens/ChatInterface/DescBlock.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/location/typadd.dart';
import 'package:tri_nethra/services/location/location.dart';
import 'package:tri_nethra/services/location/picker_page.dart';

class LocScreen extends StatefulWidget {
  final List<String> al;
  LocScreen({this.al});
  @override
  _LocScreenState createState() => _LocScreenState(al: al);
}

class _LocScreenState extends State<LocScreen> {
  List<String> ll = ['/'];
  List<String> al;
  _LocScreenState({this.al});
  int c = 0;
  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      //print(position.latitude);
      ll.add(position.latitude.toString());
      ll.add(position.longitude.toString());
      ll.add('/');
      // c += 1;
      c = (ll.where((e) => e == '/')).length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'You sure about going back,(all the Location data from this screen will be discarded)?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          ll = ['/'];
                          Navigator.pop(context, true);
                          print(al);
                          print(ll);
                        },
                        child: Text('Yes')),
                  ],
                ));
        // al.removeLast();
        // print(al);
        // Navigator.of(context).pop();
      },
      child: Scaffold(body: Builder(
        builder: (context) {
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
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: AppBar().preferredSize.height / 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          ll = ['/'];
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: OrPop(
                    popcolor: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            Text(
                              'Location Details'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontFamily: 'Quicksand',
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 20),
                  child: Wrap(
                    children: [
                      Text(
                        'Choose a operation:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        _getCurrentLocation();
                      });
                    },
                    child: but('Current Location', Icons.location_city)),
                InkWell(
                    onTap: () {
                      setState(
                        () async {
                          Location location = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapPickerPage()),
                          );
                          if (location != null) {
                            setState(() {
                              ll.add(location.lat.toString());
                              ll.add(location.lng.toString());
                              ll.add('/');
                              // c += 1;
                              c = (ll.where((e) => e == '/')).length - 1;
                            });
                          }
                        },
                      );
                    },
                    child: but('Choose Location On Map', Icons.map)),
                InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LDescribe(
                                  ll: ll,
                                )));
                        c = (ll.where((e) => e == '/')).length;
                      });
                      // c += 1;
                    },
                    child: but('Type the Addresses', Icons.keyboard)),
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.all(10),
                  //Has to Add additional info on ease of use and well description
                  child: Text(
                    "$c Information You provide will help, The text field automantically increases in size as you type on.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      if (c == 0) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text('please select any type of Location')));
                      } else {
                        print(ll);
                        print(al);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Describe(
                            al: al,
                            ll: ll,
                          );
                        }));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Next',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget but(String t, IconData i) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
      child: OrPop(
        popcolor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Wrap(
                  children: [
                    Text(
                      t.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orange,
                          fontFamily: 'Quicksand',
                          fontSize: 20),
                    ),
                  ],
                ),
                Icon(
                  i,
                  color: Colors.orange,
                )
              ]),
        ),
      ),
    );
  }
}
