import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/CrimeAwareness/WVPage.dart';
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
      Doc(1, 'Aadhar/ UIDAI '),
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

  void _signUpUser(
      String email,
      String password,
      BuildContext context,
      String docType,
      String docNumber,
      String mobile,
      String pass,
      String lname) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.signUpUser(
          email, password, docType, docNumber, mobile, pass, lname);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString + ' fill all the fields appropriatley'),
          duration: Duration(seconds: 2),
        ));
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
      body: Builder(
        builder: (context) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.orange[900],
                        Colors.orange[500],
                        Colors.orange[400]
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
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
                                    popcolor: Colors.white,
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
                                    popcolor: Colors.white,
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
                                    popcolor: Colors.white,
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
                                    popcolor: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        obscureText: true,
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
                                    popcolor: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        obscureText: true,
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
                                    popcolor: Colors.white,
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
                                    popcolor: Colors.white,
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
                                            style:
                                                TextStyle(color: Colors.white)),
                                        TextSpan(
                                            text: 'Terms of Service',
                                            style: TextStyle(
                                                color: Colors.orange[900],
                                                fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Terms of Service');
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WVP(
                                                              url:
                                                                  'https://www.policinglaw.info/country/india',
                                                            )));
                                              }),
                                        TextSpan(
                                          text: ' and that you have read our ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.orange[900],
                                                fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Privacy Policy');
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WVP(
                                                              url:
                                                                  'https://bprd.nic.in/content/68_2_PrivacyPolicy.aspx',
                                                            )));
                                              }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (_legalNameController.text != '') {
                                        if (_emailController.text != '') {
                                          if (_mobileController.text.length ==
                                              10) {
                                            if (_passwordController.text !=
                                                    '' &&
                                                _passwordController
                                                        .text.length >=
                                                    6) {
                                              if (_passwordController.text ==
                                                  _confirmPasswordController
                                                      .text) {
                                                if ((_selectedDoc
                                                                .docName ==
                                                            'Passport ' &&
                                                        _docNoController
                                                                .text.length ==
                                                            8) ||
                                                    (_selectedDoc.docName ==
                                                            'Driving License ' &&
                                                        _docNoController
                                                                .text.length ==
                                                            13) ||
                                                    (_selectedDoc
                                                                .docName ==
                                                            'Aadhar/ UIDAI ' &&
                                                        _docNoController
                                                                .text.length ==
                                                            12) ||
                                                    (_selectedDoc.docName ==
                                                            'PAN Card  ' &&
                                                        _docNoController
                                                                .text.length ==
                                                            10) ||
                                                    (_selectedDoc.docName ==
                                                            'Voter ID ' &&
                                                        _docNoController
                                                                .text.length ==
                                                            10)) {
                                                  _signUpUser(
                                                      _emailController.text,
                                                      _passwordController.text,
                                                      context,
                                                      _selectedDoc.docName,
                                                      _docNoController.text,
                                                      _mobileController.text,
                                                      _passwordController.text,
                                                      _legalNameController
                                                          .text);
                                                } else {
                                                  Scaffold.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Enter correct ${_selectedDoc.docName} details"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ));
                                                }
                                              } else {
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Passwords does'nt match"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              }
                                            } else {
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "Enter Password and password should be atleast 6 characters "),
                                                  duration:
                                                      Duration(seconds: 2),
                                                ),
                                              );
                                            }
                                          } else {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Enter mobile only digits and without country code"),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text("Enter Email Address"),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      } else {
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Enter Legal name"),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.orange[800],
                                            Colors.orange[800]
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50),
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
          );
        },
      ),
    );
  }
}
