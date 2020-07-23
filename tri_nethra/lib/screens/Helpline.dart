//testing
import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:url_launcher/url_launcher.dart';

class Number {
  String name;
  int no;
  Number({this.name, this.no});
}

class HelpLine extends StatelessWidget {
  final List<Number> a = [
    Number(name: 'NATIONAL EMERGENCY NUMBER', no: 112),
    Number(name: 'POLICE', no: 100),
    Number(name: 'FIRE', no: 101),
    Number(name: 'AMBULANCE', no: 102),
    Number(name: 'Disaster Management Services', no: 108),
    Number(name: 'Women Helpline', no: 1091),
    Number(name: 'Women Helpline - ( Domestic Abuse )', no: 181),
    Number(name: 'Air Ambulance', no: 9540161344),
    Number(name: 'Aids Helpline', no: 1097),
    Number(name: 'Anti Poison ( New Delhi )', no: 1066),
    Number(name: 'Disaster Management ( N.D.M.A )', no: 01126701728),
    Number(
        name: 'EARTHQUAKE / FLOOD / DISASTER  ( N.D.R.F Headquaters )',
        no: 01124363260),
    Number(name: 'NDRF HELPLINE NO', no: 9711077372),
    Number(
        name: 'Deputy Commissioner Of Police – Missing Child And Women',
        no: 1094),
    Number(name: 'Railway Enquiry', no: 139),
    Number(name: 'Senior Citizen Helpline', no: 1091),
    Number(name: 'Medical Helpline', no: 108),
    Number(name: 'Railway Accident Emergency Service', no: 1072),
    Number(name: 'Road Accident Emergency Service', no: 1073),
    Number(
        name:
            'Road Accident Emergency Service On National Highway For Private Operators',
        no: 1033),
    Number(name: 'ORBO Centre, AIIMS (For Donation Of Organ) Delhi', no: 1060),
    Number(name: 'Kisan Call Centre', no: 1551),
    Number(name: 'Relief Commissioner For Natural Calamities', no: 1070),
    Number(name: 'Children In Difficult Situation', no: 1098),
    Number(
        name:
            'All India Institute of Medical Sciences (AIIMS) Poision Control ( 24*7 )',
        no: 01126593677),
    Number(name: 'Tourist Helpline', no: 1363),
    Number(name: 'LPG Leak Helpline', no: 1906)
  ];
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
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
        child: Column(
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
                      print("Popping from HelpLine page");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opens in Dailer',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40),
            ),
            new Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: a.length,
                // reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: OrPop(
                      popcolor: Colors.white,
                      child: ListTile(
                        onTap: () {
                          customLaunch('tel:${a[index].no.toString()}');
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>()
                          //             // RefSearch(a: ref[index])
                          //             // )
                          //             );
                        },
                        title: Text(
                          '${a[index].name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
