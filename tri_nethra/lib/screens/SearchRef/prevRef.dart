import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tri_nethra/models/user.dart';
import 'package:tri_nethra/screens/SearchRef/refsearchscreen.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/database.dart';

class PrevRef extends StatefulWidget {
  @override
  _PrevRefState createState() => _PrevRefState();
}

class _PrevRefState extends State<PrevRef> {
  TextEditingController refController = TextEditingController();
  OurUser a = OurUser();
  List<String> ref;
  void refid() async {
    try {
      FirebaseUser _firebaseUser = await FirebaseAuth.instance.currentUser();
      if (_firebaseUser != null) {
        a = await OurDatabase().getUserInfo(_firebaseUser.uid);
        print(a.refId);
        setState(() {
          ref = a.refId;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    refid();
    super.initState();
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
                          print("Popping from PrevRef page");
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'Previous Issues:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ref.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: OrPop(
                          popcolor: Colors.white,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      RefSearch(a: ref[index])));
                            },
                            title: Text(
                              '${ref[index]}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'These are your Issue\'s Reference number sorted from latest to oldest\n\n Tap on the tile to get details about the Respective Ref no.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 2 + 50,
                          child: Container(
                            width: double.infinity,
                            child: ListView(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          // width: 20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              90,
                                          child: TextFormField(
                                            controller: refController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter your Reference Number:",
                                                // contentPadding: EdgeInsets.all(0),
                                                hintStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Icon(Icons.search),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print(refController.text);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => RefSearch(
                                                a: refController.text)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 20),
                                    child: Text(
                                      'Search',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        );
                      },
                    );

                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => RefSearch()));
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Search a Custom Reference number',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
          );
        },
      ),
    );
  }
}
