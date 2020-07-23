import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/CrimeAwareness/WVPage.dart';
import 'package:tri_nethra/screens/SearchRef/prevRef.dart';
import 'package:tri_nethra/screens/profile_page/lang.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/screens/splashscreen/splashscreen.dart';

class OurProfileScreen extends StatefulWidget {
  @override
  _OurProfileScreenState createState() => _OurProfileScreenState();
}

class _OurProfileScreenState extends State<OurProfileScreen> {
  String n, t, q, m;

  // @overrider
  getname() async {
    try {
      CurrentUser _currentUser =
          Provider.of<CurrentUser>(context, listen: false);
      t = (_currentUser.getCurrentUser.legalname);
      q = _currentUser.getCurrentUser.refId.length.toString();
    } catch (e) {}
  }

  void initState() {
    getname();
    setState(() {
      n = t;
      m = q;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                      print("Popping from Profile page");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () async {
                      CurrentUser _currentUser =
                          Provider.of<CurrentUser>(context, listen: false);
                      String _returnString = await _currentUser.signOut();
                      if (_returnString == "success") {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OurRoot(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: Text('Sign Out',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Wrap(
                children: [
                  Text(
                    n,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 40),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PrevRef()));
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 50.0, 25, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(blurRadius: 2.0, color: Colors.grey)
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                                  child: Text(
                                    'YOU HAVE',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      25.0, 40.0, 5.0, 25.0),
                                  child: Text(
                                    q,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5.0, 25.0, 5.0, 5.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Registered Issues',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 60.0),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                SizedBox(height: 10.0),
                GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0,
                  shrinkWrap: true,
                  children: <Widget>[
                    _buildCard(
                      'Website',
                      'Takes you to the Official Website',
                      1,
                      Icons.dashboard,
                      WVP(
                        url:
                            'https://www.tspolice.gov.in/jsp/homePage?method=getHomePageElements',
                      ),
                    ),
                    _buildCard('Password', 'Change the Account\'s Password', 2,
                        Icons.vpn_key, OurSplashScreen()),
                    _buildCard(
                      'Q&A',
                      'Most Frequently asked Questions',
                      3,
                      Icons.account_balance,
                      WVP(
                        url:
                            'https://www.transport.telangana.gov.in/html/faqs.php',
                      ),
                    ),
                    _buildCard(
                      'Language',
                      'Select Language for App',
                      4,
                      Icons.translate,
                      Lang(),
                    ),
                    // _buildCard('Tom', 'Away', 5),
                    // _buildCard('Tom', 'Available', 6),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      String name, String title, int cardIndex, IconData i, var u) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => u),
        );
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 0.0,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.orange,
                  ),
                ),
                Icon(i)
              ]),
              SizedBox(height: 8.0),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Wrap(children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ]),
              ),
            ],
          ),
          margin: cardIndex.isEven
              ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
              : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)),
    );
  }
}
