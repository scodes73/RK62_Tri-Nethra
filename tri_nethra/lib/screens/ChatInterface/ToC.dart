//test Screen

import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/ChatInterface/ChatScreen2.dart';
import 'package:tri_nethra/screens/ChatInterface/CyberCrime.dart';
import 'package:tri_nethra/screens/ChatInterface/Death.dart';
import 'package:tri_nethra/screens/ChatInterface/DefaultBlock.dart';
import 'package:tri_nethra/screens/ChatInterface/ReportAccident.dart';
import 'package:tri_nethra/screens/ChatInterface/StreetCrime.dart';
import 'package:tri_nethra/screens/ChatInterface/WhiteCollar.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class ToC extends StatefulWidget {
  List<String> al;
  ToC({this.al});
  @override
  _ToCState createState() => _ToCState(al: al);
}

class _ToCState extends State<ToC> {
  String sel;
  List<String> al;
  _ToCState({this.al});
  IconData i1 = Icons.panorama_fish_eye,
      i2 = Icons.panorama_fish_eye,
      i3 = Icons.panorama_fish_eye,
      i4 = Icons.panorama_fish_eye,
      i5 = Icons.panorama_fish_eye,
      i6 = Icons.panorama_fish_eye;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      Navigator.pop(context);
                      al.removeLast();
                      print(al);
                      print("Popping from ToC page");
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
                          'Note that Your Data will be held Confidential'
                              .toUpperCase(),
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
                    'Select the Type of Issue, you want to report:',
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
                    i5 = Icons.panorama_fish_eye;
                    i6 = Icons.panorama_fish_eye;
                    sel = "SC";
                  });
                },
                child: but('Street Crime', i1)),
            InkWell(
                onTap: () {
                  setState(() {
                    i1 = Icons.panorama_fish_eye;
                    i2 = Icons.check_circle;
                    i3 = Icons.panorama_fish_eye;
                    i4 = Icons.panorama_fish_eye;
                    i5 = Icons.panorama_fish_eye;
                    i6 = Icons.panorama_fish_eye;
                    sel = "Death";
                  });
                },
                child: but('Death', i2)),
            InkWell(
                onTap: () {
                  setState(() {
                    i1 = Icons.panorama_fish_eye;
                    i2 = Icons.panorama_fish_eye;
                    i3 = Icons.check_circle;
                    i4 = Icons.panorama_fish_eye;
                    i5 = Icons.panorama_fish_eye;
                    i6 = Icons.panorama_fish_eye;
                    sel = "DC";
                  });
                },
                child: but('Drug Crime', i3)),
            InkWell(
                onTap: () {
                  setState(() {
                    i1 = Icons.panorama_fish_eye;
                    i2 = Icons.panorama_fish_eye;
                    i3 = Icons.panorama_fish_eye;
                    i4 = Icons.check_circle;
                    i5 = Icons.panorama_fish_eye;
                    i6 = Icons.panorama_fish_eye;
                    sel = "CC";
                  });
                },
                child: but('Cyber Crime', i4)),
            InkWell(
                onTap: () {
                  setState(() {
                    i1 = Icons.panorama_fish_eye;
                    i2 = Icons.panorama_fish_eye;
                    i3 = Icons.panorama_fish_eye;
                    i4 = Icons.panorama_fish_eye;
                    i5 = Icons.check_circle;
                    i6 = Icons.panorama_fish_eye;
                    sel = "WCC";
                  });
                },
                child: but('White-Collar Crime', i5)),
            InkWell(
                onTap: () {
                  setState(() {
                    i1 = Icons.panorama_fish_eye;
                    i2 = Icons.panorama_fish_eye;
                    i3 = Icons.panorama_fish_eye;
                    i4 = Icons.panorama_fish_eye;
                    i5 = Icons.panorama_fish_eye;
                    i6 = Icons.check_circle;
                    sel = "RAA";
                  });
                },
                child: but('Report an Accident', i6)),
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            InkWell(
                onTap: () {
                  al.add(sel);
                  print(al);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (sel == 'SC') {
                      return SC(
                        al: al,
                      );
                    } else if (sel == 'Death') {
                      return Death(
                        al: al,
                      );
                    } else if (sel == 'WCC') {
                      return WCC(
                        al: al,
                      );
                    } else if (sel == 'RAA') {
                      return RAA(
                        al: al,
                      );
                    } else if (sel == 'CC') {
                      return CC(
                        al: al,
                      );
                    } else if (sel == 'DC') {
                      return DB(
                        al: al,
                      );
                    }
                    return SecondPage();
                  }));
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
