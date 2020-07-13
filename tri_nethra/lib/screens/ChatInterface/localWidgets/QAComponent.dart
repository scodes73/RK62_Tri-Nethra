// import 'package:flutter/material.dart';
// import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

// class QAComp extends StatefulWidget {
//   final String q;
//   final List<String> choices;
//   int _defaultChoiceIndex;
//   QAComp({this.q, this.choices});

//   @override
//   _QACompState createState() => _QACompState();
// }

// class _QACompState extends State<QAComp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 100,
//           ),
//           OrPop(
//             popcolor: Colors.white,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(color: Colors.grey[200]))),
//                     child: Text(widget.q)),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.all(10),
//                   child: choiceChips(),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

import 'package:flutter/material.dart';
// import 'package:tri_nethra/models/Questions.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';

class QAComp extends StatefulWidget {
  QAComp({this.q, this.a});
  String q;
  List<String> a;
  @override
  _QACompState createState() => _QACompState(q: q, a: a);
}

class _QACompState extends State<QAComp> {
  bool _isSelected;

  List<String> _choices;
  int _defaultChoiceIndex;
  String selectedString;
  String q;
  List<String> a;
  _QACompState({this.q, this.a});
  @override
  void initState() {
    super.initState();

    _isSelected = false;
    // _defaultChoiceIndex ;

    _choices = a;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OrPop(
              popcolor: Colors.black,
              child: Text(
                q,
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
          choiceChips(),
        ],
      ),
    );
  }

  Widget choiceChips() {
    return Expanded(
      child: ListView.builder(
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(_choices[index]),
            selected: _defaultChoiceIndex == index,
            selectedColor: Colors.green,
            onSelected: (bool selected) {
              setState(() {
                _defaultChoiceIndex = selected ? index : null;
                selectedString = _choices[index];
                print(selectedString);
              });
            },
            backgroundColor: Colors.blue,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  //Widget chip(String label, Color color) {
  //   return Chip(
  //     labelPadding: EdgeInsets.all(5.0),
  //     avatar: CircleAvatar(
  //       backgroundColor: Colors.blueAccent,
  //       child: Text(label[0].toUpperCase()),
  //     ),
  //     label: Text(
  //       label,
  //       style: TextStyle(
  //         color: Colors.white,
  //       ),
  //     ),
  //     backgroundColor: color,
  //     elevation: 6.0,
  //     shadowColor: Colors.grey[60],
  //     padding: EdgeInsets.all(6.0),
  //   );
  // }
}
