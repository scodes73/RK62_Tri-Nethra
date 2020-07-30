import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/location/locationScreen.dart';

class DTPK extends StatefulWidget {
  final List<String> al;
  DTPK({this.al});
  @override
  _DTPKState createState() => _DTPKState(al: al);
}

class _DTPKState extends State<DTPK> {
  final List<String> al;
  _DTPKState({this.al});
  bool d = false, t = false;
  TextEditingController _desController = TextEditingController();
  DateTime dt = DateTime.now();
  DateTime cdt;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'Would you like to discard this issue?(Your Data will be held CONFIDENTIAL)'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
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
              child: Container(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: AppBar().preferredSize.height),
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
                              print("Popping from DTPK page");
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                                  'Approximate date & time of Incident/receiving/viewing of content'
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.orange,
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (date) {
                                    setState(() {
                                      cdt = date;
                                      d = true;
                                    });
                                    print(date);
                                  }),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 50, right: 50),
                        child: OrPop(
                            popcolor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Center(
                                child: Text(
                                  cdt == null || !d
                                      ? 'Select Date'
                                      : 'Date: ${cdt.day.toString()} / ${cdt.month.toString()} / ${cdt.year.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (time) {
                                    setState(() {
                                      cdt = time;
                                      t = true;
                                    });

                                    print(cdt);
                                  }),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 50, right: 50),
                        child: OrPop(
                            popcolor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Center(
                                child: Text(
                                    cdt == null || !t
                                        ? 'Select Time'
                                        : 'Time = ${cdt.hour.toString()} : ${cdt.minute.toString()} ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: OrPop(
                        popcolor: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: _desController,
                            decoration: InputDecoration(
                                hintText:
                                    "Reason for delay in reporting : (OPTIONAL)",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (!t && !d) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'please select both state and district')));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LocScreen(
                                      al: al,
                                    )));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, right: 30.0),
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
          },
        ),
      ),
    );
  }
}
