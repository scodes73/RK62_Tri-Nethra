//testing
import 'package:flutter/material.dart';
import 'package:tri_nethra/models/Issue.dart';
import 'package:tri_nethra/services/database.dart';

class RefSearch extends StatefulWidget {
  final String a;
  RefSearch({this.a});

  @override
  _RefSearchState createState() => _RefSearchState(a: a);
}

class _RefSearchState extends State<RefSearch> {
  final String a;
  OurIssue i = OurIssue();
  _RefSearchState({this.a});
  getDetails() async {
    try {
      print(a);
      var t = await OurDatabase().getIssueInfo(a);
      setState(() {
        i = t;
      });
    } catch (e) {
      print('t');
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(i.doneBy == null ? 'loading' : i.doneBy),
    ));
  }
}
