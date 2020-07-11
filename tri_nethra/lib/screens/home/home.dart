import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/services/modalTrigger.dart';

class HomeScreen extends StatelessWidget {
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
                      onPressed: () async {
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

                        print("Sending to Profile page");
                      },
                    ),
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
                                  'Register a New Crime',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.add),
                            ],
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
                        child: ModalTrigger()),
                    //search
                    // GestureDetector(
                    //   onTap: () {
                    //     _onSearchPressed(context);
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(12.0),
                    //       child: OrPop(
                    //         popcolor: Colors.white,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: <Widget>[
                    //             Padding(
                    //               padding: EdgeInsets.all(30),
                    //               child: Text(
                    //                 'Search a Reference number',
                    //                 textAlign: TextAlign.start,
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             Icon(Icons.search),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
}

// body: Column(
//   children: <Widget>[
//     Center(
//       child: RaisedButton(onPressed: () async {
//         // has to be async func, and add to profile screen
//         CurrentUser _currentUser =
//             Provider.of<CurrentUser>(context, listen: false);
//         String _returnString = await _currentUser.signOut();
//         if (_returnString == "success") {
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OurRoot(),
//             ),
//             (route) => false,
//           );
//         }
//       }),
//     ),
//   ],

//appBar: AppBar(title: Text(_uid)),
//             ));
//   }
// }
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('Home'),
//     );
//   }
// }
