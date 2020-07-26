import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/CrimeAwareness/WVPage.dart';
import 'package:tri_nethra/screens/home/home.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/screens/signup/signup.dart';

class OurLogin extends StatefulWidget {
  @override
  _OurLoginState createState() => _OurLoginState();
}

class _OurLoginState extends State<OurLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void _loginanon(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.loginAnon();
      if (_returnString == "success") {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    anon: true,
                  )),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {}
  }

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.loginUser(email, password);
      if (_returnString == "success") {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[500],
              Colors.orange[400]
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //FadeAnimation(
                      //1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ), //),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            //FadeAnimation(
                            //  1.4,
                            OrPop(
                              popcolor: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                          hintText: "Email ",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
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
                                ],
                              ),
                            ), //),
                            SizedBox(
                              height: 40,
                            ),
                            //FadeAnimation(
                            //1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            //),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                _loginUser(_emailController.text,
                                    _passwordController.text, context);
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.orange[800],
                                      Colors.orange[400]
                                    ]),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900]),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ), //),
                            SizedBox(
                              height: 50,
                            ),
                            //FadeAnimation(
                            //1.7,
                            Text(
                              "TRI-NETHRA",
                              style: TextStyle(
                                  color: Colors.orange[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            //),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              onPressed: () {
                                _loginanon(context);
                              },
                              child: Text('data'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                              child: //FadeAnimation(
                                  //1.8,
                                  RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Don't have an account? ",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontStyle: FontStyle.italic)),
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.orange[900]),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => SignUp(),
                                          ));
                                          print('Sending to Sign Up page');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //),
                            //FadeAnimation(
                            //  1.8,
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
                                      style:
                                          TextStyle(color: Colors.orange[900]),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service');
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) => WVP(
                                                        url:
                                                            'https://www.policinglaw.info/country/india',
                                                      )));
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
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) => WVP(
                                                        url:
                                                            'https://bprd.nic.in/content/68_2_PrivacyPolicy.aspx',
                                                      )));
                                        }),
                                ],
                              ),
                            )
                            // RaisedButton(
                            // key:
                            //Text(
                            //"Don't have an account? Sign Up",
                            //style: TextStyle(color: Colors.grey),
                            //),
                            //),
                            , //  ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
