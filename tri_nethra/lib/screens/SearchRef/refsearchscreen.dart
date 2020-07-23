//testing
import 'package:flutter/material.dart';
import 'package:tri_nethra/models/Issue.dart';
import 'package:tri_nethra/models/user.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/database.dart';

class RefSearch extends StatefulWidget {
  final String a;
  RefSearch({this.a});

  @override
  _RefSearchState createState() => _RefSearchState(a: a);
}

class _RefSearchState extends State<RefSearch> {
  final String a;
  OurIssue i = OurIssue();
  String n;

  _RefSearchState({this.a});
  getUser(OurIssue i) async {
    try {
      OurUser u = await OurDatabase().getUserInfo(i.doneBy);
      setState(() {
        n = u.legalname;
        if (n == null) {
          print('snu');
          n = 's';
        }
      });
    } catch (e) {
      print(e);
    }
  }

  getDetails() async {
    try {
      print(a);
      var t = await OurDatabase().getIssueInfo(a);
      OurUser u = await OurDatabase().getUserInfo(i.doneBy);

      setState(() {
        // getUser(i);
        i = t;
        n = u.legalname;
        print(n);
      });
    } catch (e) {
      print('t');
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getDetails();
      //getUser(i);
    });
  }

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
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Ref Search",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          iconSize: 50,
                          icon: Icon(Icons.keyboard_arrow_left),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                            print("Popping out from Ref Search page");
                          },
                        ),
                      ],
                    ), //),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: OrPop(
                  popcolor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        i.refNo,
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Status:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: OrPop(
                  popcolor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        i.status,
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Text(
                    'Status:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: OrPop(
                  popcolor: Colors.white,
                  child: Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        i.remarks,
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 15, top: 10),
              //   child: Text('Done by'),
              // ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   child: OrPop(
              //     popcolor: Colors.white,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Center(
              //         child: Text(
              //           'ab',
              //           style: TextStyle(
              //             color: Colors.orange,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ));
    }));
  }
}
