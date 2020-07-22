import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/SearchRef/prevRef.dart';
import 'package:tri_nethra/screens/TestScreens/testscreen.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class ModalTrigger extends StatefulWidget {
  @override
  _ModalTriggerState createState() => _ModalTriggerState();
}

class _ModalTriggerState extends State<ModalTrigger> {
  // String val = 'Not yet Selected';
  TextEditingController refController = TextEditingController();
  _showSearchFieldSheet(context) {
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
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // width: 20,
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            controller: refController,
                            decoration: InputDecoration(
                                hintText: "Enter your Reference Number:",
                                // contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Te(a: refController.text)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20),
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
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _showSearchFieldSheet(context);
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => RefSearch()));
                },
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              'Search a Reference number',
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => PrevRef()));
                },
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              'Previous Reference numbers',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            Icons.history,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'Search a Reference number',
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
    );
  }
}
