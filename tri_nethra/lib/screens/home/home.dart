import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/ChatInterface/ToC.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/screens/profile_page/profileui.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String val = 'Not yet Selected';
  @override
  Widget build(BuildContext context) {
    final _data = MediaQuery.of(context);

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
            Column(
              children: <Widget>[
                SizedBox(
                  height: _data.size.height / 30,
                ),
                //icon profile
                Row(
                  children: <Widget>[
                    IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.account_circle),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OurProfileScreen()));
                          print("Send to Profile Page");
                        }),
                  ],
                ),
                //TriNethra Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Tri-Nethra ",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ],
                ),
                SizedBox(
                  height: _data.size.height / 20,
                ),
                //Crime Reg
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: _data.size.height / 55,
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: OrPop(
                          popcolor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  'Crime Awareness',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.insert_chart),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _data.size.height / 50,
                    ), //crime aware
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ToC()));
                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: OrPop(
                            popcolor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                    'Register a New Crime',
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _data.size.height / 50,
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Colors.transparent),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showModalBottomSheet(context);
                            },
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: OrPop(
                                  popcolor: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Text(
                                          'Search a Reference number',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(Icons.search),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(val),
                    SizedBox(
                      height: _data.size.height / 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Helpline Number ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.call)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('Search'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      val = 'Search';
                    });
                  }),
              ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('Prev'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      val = 'prev';
                    });
                  })
            ],
          ),
        );
      },
    );
  }
}
