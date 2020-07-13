import 'package:flutter/material.dart';
import 'package:tri_nethra/models/Questions.dart';
import 'package:tri_nethra/screens/ChatInterface/localWidgets/QAComponent.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Question> l;
  Question q = new Question();
  @override
  void initState() {
    super.initState();
    q.setQuestion('getQuestion');
    q.setAnswer(['a', 'a']);
  }

  @override
  Widget build(BuildContext context) {
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
          child: QAComp(
            q: q.getQuestion(),
            a: q.getAnswer(),
          )),
    );
  }
}
