import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/location/locationScreen.dart';

class Auto extends StatefulWidget {
  final List<String> al;
  Auto({this.al});
  @override
  _AutoState createState() => _AutoState(al: al);
}

class _AutoState extends State<Auto> {
  TextEditingController mak = new TextEditingController();
  TextEditingController mod = new TextEditingController();
  TextEditingController reg = new TextEditingController();
  List<String> al;
  _AutoState({this.al});
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
                  ],
                ),
              ),
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
                            print("Popping from Auto page");
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
                            height: 30,
                          ),
                          Wrap(
                            children: [
                              Text(
                                'Auto Theft'.toUpperCase(),
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
                            height: 30,
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                                child: Column(
                                  children: <Widget>[
                                    OrPop(
                                      popcolor: Colors.white,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: mak,
                                          decoration: InputDecoration(
                                              hintText: "Make of the vehicle",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    OrPop(
                                      popcolor: Colors.white,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: mod,
                                          decoration: InputDecoration(
                                              hintText: "Model Name",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    OrPop(
                                      popcolor: Colors.white,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: reg,
                                          decoration: InputDecoration(
                                              hintText: "Registration No",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        if (mak.text == '' ||
                            mod.text == '' ||
                            reg.text == '') {
                          print('ss');
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Please fill all the details:'),
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          al.add(mak.text);
                          al.add(mod.text);
                          al.add(reg.text);
                          print(al);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
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
}
