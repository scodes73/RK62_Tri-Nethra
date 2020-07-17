import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class Describe extends StatefulWidget {
  // final List<String> al;
  // final List<String> ll;
  // Describe({this.al, this.ll});
  @override
  _DescribeState createState() => _DescribeState(/*al: al, ll: ll*/);
}

class _DescribeState extends State<Describe> {
  TextEditingController _desController = TextEditingController();
  // List<String> al;
  // List<String> ll;
  // _DescribeState({this.al, this.ll});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // al.removeLast();
        Navigator.of(context).pop();
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
                            'Please Describe the situation in your own Words'
                                .toUpperCase(),
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
                          hintText: "Write your Description Here",
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
        ),
      ),
    );
  }
}
