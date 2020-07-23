import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class Lang extends StatefulWidget {
  @override
  _LangState createState() => _LangState();
}

class _LangState extends State<Lang> {
  IconData i1 = Icons.check_circle, i2 = Icons.panorama_fish_eye;

  String sel = 'English';
  callsn(context, String sel) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('As of now $sel isn\'t ready, only english available '),
        duration: Duration(
          seconds: 2,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          print("Popping from Lang page");
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
                                  fontWeight: FontWeight.bold,
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
                        'Choose the language :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "English";
                      });
                    },
                    child: but('English', i1)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Hindi";
                        callsn(context, sel);
                      });
                    },
                    child: but('Hindi', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Telugu";
                        callsn(context, sel);
                      });
                    },
                    child: but('Telugu', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Tamil";
                        callsn(context, sel);
                      });
                    },
                    child: but('Tamil', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Bengali";
                        callsn(context, sel);
                      });
                    },
                    child: but('Bengali', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Malayalam";
                        callsn(context, sel);
                      });
                    },
                    child: but('Malayalam', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Marathi";
                        callsn(context, sel);
                      });
                    },
                    child: but('Marathi', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Gujurati";
                        callsn(context, sel);
                      });
                    },
                    child: but('Gujurati', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Urdu";
                        callsn(context, sel);
                      });
                    },
                    child: but('Urdu', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Kannada";
                        callsn(context, sel);
                      });
                    },
                    child: but('Kannada', i2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        sel = "Odia";
                        callsn(context, sel);
                      });
                    },
                    child: but('Odia', i2)),
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
              ],
            ),
          );
        },
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
