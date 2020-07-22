import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/location/locationScreen.dart';

class RAA extends StatefulWidget {
  final List<String> al;
  RAA({this.al});
  @override
  _RAAState createState() => _RAAState(al: al);
}

class _RAAState extends State<RAA> {
  TextEditingController dea = TextEditingController();
  TextEditingController inj = TextEditingController();
  TextEditingController hosp = TextEditingController();
  IconData i1 = Icons.panorama_fish_eye,
      i2 = Icons.panorama_fish_eye,
      i3 = Icons.panorama_fish_eye;
  List<String> al;
  _RAAState({this.al});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        al.removeLast();
        print(al);
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Builder(builder: (context) {
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
                          al.removeLast();
                          print(al);
                          print("Popping from RAA page");
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
                              'Accident BLOCK'.toUpperCase(),
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
                        Container(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  OrPop(
                                    popcolor: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: dea,
                                        decoration: InputDecoration(
                                            hintText: "No. of deaths, if any",
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
                                        controller: inj,
                                        decoration: InputDecoration(
                                            hintText: "No. of injured, if any",
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
                                        controller: hosp,
                                        decoration: InputDecoration(
                                            hintText:
                                                "No of Hospitalised, if any",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
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
                      if (dea.text == '' || hosp.text == '' || inj.text == '') {
                        print('ss');
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Please fill all the details:'),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        al.add(dea.text);
                        al.add(inj.text);
                        al.add(hosp.text);
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
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
