import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class Doc {
  int id;
  String docName;
  Doc(this.id, this.docName);
  static List<Doc> getDocs() {
    return <Doc>[
      Doc(1, 'Aadhar/ UDAI '),
      Doc(2, 'Voter ID '),
      Doc(3, 'Passport '),
      Doc(4, 'PAN Card '),
      Doc(5, 'Driving License '),
    ];
  }
}

class _SignUpState extends State<SignUp> {
  TextEditingController _legalNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _docNoController = TextEditingController();
  String ddv;
  List<Doc> _docs = Doc.getDocs();
  List<DropdownMenuItem<Doc>> _ddMenuItems;
  Doc _selectedDoc;

  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await _currentUser.signUpUser(email, password)) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _ddMenuItems = buildDropdownMenuItems(_docs);
    _selectedDoc = _ddMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Doc>> buildDropdownMenuItems(List docs) {
    List<DropdownMenuItem<Doc>> items = List();
    for (Doc doc in docs) {
      items.add(
        DropdownMenuItem(
          child: Text(
            doc.docName,
            style: TextStyle(color: Colors.grey),
          ),
          value: doc,
        ),
      );
    }
    return items;
  }

  onChangeDDMenuItem(Doc selectedDoc) {
    setState(() {
      _selectedDoc = selectedDoc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.orange[900],
                    Colors.orange[300],
                    Colors.orange[200]
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                            IconButton(
                              iconSize: 50,
                              icon: Icon(Icons.keyboard_arrow_left),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pop();
                                print("Popping out from SignUp page");
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ) //),
                      ],
                    ),
                  ),
                  //SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                          child: Column(
                            children: <Widget>[
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _legalNameController,
                                    decoration: InputDecoration(
                                        hintText: "Legal Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        hintText: "Email Address",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _mobileController,
                                    decoration: InputDecoration(
                                        hintText: "Phone Number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _confirmPasswordController,
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              OrPop(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: DropdownButton(
                                    underline: Text(''),
                                    dropdownColor: Colors.white,
                                    items: _ddMenuItems,
                                    value: _selectedDoc,
                                    onChanged: onChangeDDMenuItem,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              OrPop(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _docNoController,
                                    decoration: InputDecoration(
                                        hintText: "Enter " +
                                            _selectedDoc.docName +
                                            " Number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 10),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'By clicking Sign Up, you agree to our ',
                                        style: TextStyle(color: Colors.grey)),
                                    TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                            color: Colors.orange[900]),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Terms of Service');
                                          }),
                                    TextSpan(
                                      text: ' and that you have read our ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.orange[900]),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Privacy Policy');
                                          }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_passwordController.text ==
                                      _confirmPasswordController.text) {
                                    _signUpUser(_emailController.text,
                                        _passwordController.text, context);
                                  } else {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Passwords does'nt match"),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.orange[800],
                                        Colors.orange[800]
                                      ]),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[900]),
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}
