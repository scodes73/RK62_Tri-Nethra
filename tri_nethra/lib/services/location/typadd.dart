import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class LDescribe extends StatefulWidget {
  // final List<String> al;
  final List<String> ll;
  LDescribe(
      {
      // this.al,
      this.ll});
  @override
  _LDescribeState createState() => _LDescribeState(
      //al: al,
      ll: ll);
}

class _LDescribeState extends State<LDescribe> {
  TextEditingController _desController = TextEditingController();
  // List<String> al;
  List<String> ll;
  _LDescribeState(
      {
      //this.al,
      this.ll});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // al.removeLast();
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
                        // al.removeLast();
                        // print(al);
                        print("Popping from DefB page");
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
                            'Please type the relevant addresses'.toUpperCase(),
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
                          hintText: "Write your Address Here",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(10),
                //Has to Add additional info on ease of use and well description
                child: Text(
                  "The Information You provide will help, The text field automantically increases in size as you type on.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      ll.add(_desController.text);
                      ll.add('/');
                      Navigator.of(context).pop();
                    });
                    // al.add(sel);
                    // print(al);
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   if (sel == 'Auto Theft') {
                    //     return Auto(
                    //       al: al,
                    //     );
                    //   }
                    //   return LB(
                    //     al: al,
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Done',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Icon(
                          Icons.turned_in,
                          size: 30,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
