import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class LDescribe extends StatefulWidget {
  // final List<String> al;
  final List<String> ll;
  // final List<String> check;
  LDescribe({
    // this.al,
    this.ll,
    // this.check
  });
  @override
  _LDescribeState createState() => _LDescribeState(
      //al: al,
      // check: check,
      ll: ll);
}

class _LDescribeState extends State<LDescribe> {
  TextEditingController _desController = TextEditingController();
  // List<String> al;
  List<String> ll;
  // List<String> check;
  _LDescribeState(
      {
      // this.check,
      this.ll});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // al.removeLast();
        // Navigator.of(context).pop();
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'You sure about going back,(all the data from this screen will be discarded)?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                          // check = ['no'];
                        },
                        child: Text('Yes')),
                  ],
                ));
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
                        print("Popping from typeadd page");
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      'You sure about going back,(all the Location data from this screen will be discarded)?'),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: Text('No')),
                                    FlatButton(
                                        onPressed: () {
                                          ll = ['/'];
                                          Navigator.pop(context, true);
                                          // check = ['no'];
                                          print(ll);
                                        },
                                        child: Text('Yes')),
                                  ],
                                ));
                        // al.removeLast();
                        // print(al);
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
                    setState(
                      () {
                        if (_desController.text != '') {
                          ll.add(_desController.text);
                          ll.add('/');
                          // check = ['yes'];
                          Navigator.of(context).pop();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'You sure about going back,(You have\'nt entered any data)?'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: Text('No')),
                                      FlatButton(
                                          onPressed: () {
                                            ll = ['/'];
                                            // check = ['no'];
                                            print(ll);
                                            Navigator.pop(context, true);
                                            Navigator.pop(context, true);
                                          },
                                          child: Text('Yes')),
                                    ],
                                  ));
                        }
                      },
                    );
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
