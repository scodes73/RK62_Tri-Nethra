import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/ChatInterface/HK.dart';
import 'package:tri_nethra/screens/ChatInterface/LOM.dart';
import 'package:tri_nethra/screens/ChatInterface/OH.dart';
import 'package:tri_nethra/screens/ChatInterface/OOC.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/location/locationScreen.dart';

class OCC extends StatefulWidget {
  final List<String> al;
  OCC({this.al});
  @override
  _OCCState createState() => _OCCState(al: al);
}

class _OCCState extends State<OCC> {
  IconData i1 = Icons.panorama_fish_eye,
      i2 = Icons.panorama_fish_eye,
      i3 = Icons.panorama_fish_eye,
      i4 = Icons.panorama_fish_eye;

  List<String> al;
  String sel;
  _OCCState({this.al});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'You sure about going back,(all the data from this screen is discarded)?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          al.removeLast();
                          Navigator.pop(context, true);
                          print(al);
                        },
                        child: Text('Yes')),
                  ],
                ));
      },
      child: Scaffold(
        body: Builder(
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
                    Colors.orange[500],
                    Colors.orange[400]
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
                            Navigator.pop(context);
                            al.removeLast();
                            print(al);
                            print("Popping from OCC page");
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
                                'Cyber Crime'.toUpperCase(),
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
                          'Select one among the following cases in regard:',
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
                          i1 = Icons.check_circle;
                          i2 = Icons.panorama_fish_eye;
                          i3 = Icons.panorama_fish_eye;
                          i4 = Icons.panorama_fish_eye;

                          sel = 'Loss of Money';
                        });
                      },
                      child: but('Loss of Money', i1)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          i1 = Icons.panorama_fish_eye;
                          i2 = Icons.check_circle;
                          i3 = Icons.panorama_fish_eye;
                          i4 = Icons.panorama_fish_eye;

                          sel = 'Online Harassment';
                        });
                      },
                      child: but('Online Harassment', i2)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          sel = 'Hacking';
                          i1 = Icons.panorama_fish_eye;
                          i2 = Icons.panorama_fish_eye;
                          i3 = Icons.check_circle;
                          i4 = Icons.panorama_fish_eye;
                        });
                      },
                      child: but('Hacking', i3)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          sel = 'Other Online crime';
                          i1 = Icons.panorama_fish_eye;
                          i2 = Icons.panorama_fish_eye;
                          i3 = Icons.panorama_fish_eye;
                          i4 = Icons.check_circle;
                        });
                      },
                      child: but('Other Online crime', i4)),
                  SizedBox(
                    height: AppBar().preferredSize.height,
                  ),
                  InkWell(
                      onTap: () {
                        if (sel == null) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('please select any of the option')));
                        } else if (sel == "") {
                          al.add(sel);
                          print(al);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            if (sel == "Loss of Money") {
                              return LOM(al: al);
                            } else if (sel == 'Online Harassment') {
                              return OH(al: al);
                            } else if (sel == 'Hacking') {
                              return HK(al: al);
                            } else if (sel == 'Other Online Crime') {
                              return OOC(al: al);
                            }
                            return LocScreen(
                              al: al,
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
        ),
      ),
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
