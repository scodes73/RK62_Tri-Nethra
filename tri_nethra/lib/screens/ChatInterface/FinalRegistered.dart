import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tri_nethra/models/user.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/screens/login/login.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/services/database.dart';

class IssueFinal extends StatefulWidget {
  final bool anon;
  final String rid;
  IssueFinal({this.anon = false, this.rid});
  @override
  _IssueFinalState createState() => _IssueFinalState(anon: anon, rid: rid);
}

class _IssueFinalState extends State<IssueFinal> {
  bool anon;
  String rid;
  _IssueFinalState({this.anon, this.rid});
  OurUser a = OurUser();
  String ref;
  void refid() async {
    try {
      FirebaseUser _firebaseUser = await FirebaseAuth.instance.currentUser();
      if (_firebaseUser != null) {
        a = await OurDatabase().getUserInfo(_firebaseUser.uid);
        print(a.refId.last);
        setState(() {
          ref = a.refId.last;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @mustCallSuper
  void initState() {
    // refid();
    ref = rid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'You Issue is Registered, would you like to go to home?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('Stay Here')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => OurRoot()));
                        },
                        child: Text('Take to Home')),
                  ],
                ));

        // al.removeLast();
        // print(al);
        // Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Container(
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
                            'Registration Successful'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                fontFamily: 'Quicksand',
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: OrPop(
                  popcolor: Colors.white,
                  child: Container(
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 12,
                        ),
                        Text(
                          'Your registration is Successful\n\n Please use this Reference no. for any further queries\n',
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          ref != null ? ref : 'Loading',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        anon
                            ? Text(
                                ' This data is also present in your \n Previous Searches page ',
                                textAlign: TextAlign.center,
                              )
                            : Container()
                      ],
                    )),
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ),
              SizedBox(height: 80),
              InkWell(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => anon ? OurLogin() : OurRoot()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Home',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
