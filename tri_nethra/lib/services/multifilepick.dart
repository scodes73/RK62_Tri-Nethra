import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/ChatInterface/FinalRegistered.dart';
import 'package:tri_nethra/screens/login/localwidgets/orpop.dart';
import 'package:tri_nethra/services/database.dart';

class MultiFilePick extends StatefulWidget {
  final List<String> ll, al;
  // final bool anon;
  MultiFilePick({
    this.al,
    this.ll,
  });

  @override
  _MultiFilePickState createState() => _MultiFilePickState(
        al: al,
        ll: ll,
      );
}

class _MultiFilePickState extends State<MultiFilePick> {
  List<String> atl = ['/'];
  List<String> ll, al, fn = [];

  _MultiFilePickState({
    this.al,
    this.ll,
  });
  String _path;
  Map<String, String> _paths;
  String _extension;
  FileType _pickType = FileType.any;
  bool _multiPick = true;
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer() async {
    try {
      _path = null;
      if (_multiPick) {
        _paths = await FilePicker.getMultiFilePath(type: _pickType);
      }
      uploadToFirebase();
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  uploadToFirebase() {
    if (_multiPick) {
      _paths.forEach((fileName, filePath) {
        setState(() {
          fn.add(fileName);
        });
        upload(fileName, filePath);
      });
    } else {
      String fileName = _path.split('/').last;
      String filePath = _path;
      upload(fileName, filePath);
      fn.add(fileName);
    }
  }

  upload(fileName, filePath) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    print(_currentUser.getCurrentUser.uid);
    _extension = fileName.toString().split('.').last;
    StorageReference storageRef = FirebaseStorage.instance
        .ref()
        .child(_currentUser.getCurrentUser.uid + '/' + fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(filePath),
      StorageMetadata(
        contentType: '$_pickType/$_extension',
      ),
    );
    StorageTaskSnapshot _ts = await uploadTask.onComplete;
    // print(storageRef.getDownloadURL().toString()));
    // setState(() async {
    print(_ts);
    String url = await storageRef.getDownloadURL();
    print("url is $url");
    // final String url = await uploadTask.lastSnapshot.ref.getDownloadURL();
    atl.add(url.toString());
    print(atl);
    _tasks.add(uploadTask);
  }
  // );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      'You sure about going back,(all the Attachments from this screen will be discarded)?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          al.removeLast();
                          Navigator.pop(context, true);
                          print(al);
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
                Colors.orange[500],
                Colors.orange[400]
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
                        al.removeLast();
                        print(al);
                        print("Popping from FilePick page");
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
                            'Attach files'.toUpperCase(),
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
                      ),
                    ],
                  ),
                ),
              ),
              // Text(
              //   fn.length == 0 ? 'not selected' : '$fn',
              //   style: TextStyle(color: Colors.amber),
              // ),
              Container(
                padding: EdgeInsets.all(15),
                child: OrPop(
                  popcolor: Colors.white,
                  child: Container(
                    child: Center(
                      child: fn.length > 0
                          ? Text(
                              'You have attached\n ${fn.length} files\n You can still add files or proceed further.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'You Have not select any Attachments, kindly attach any files if needed \n \n You can select multiple files across the device',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    CurrentUser _currentUser =
                        Provider.of<CurrentUser>(context, listen: false);
                    print(_currentUser.getCurrentUser.uid);
                    print(_currentUser.getCurrentUser.refId);
                    print('this is');
                    print(atl);
                    String _returnString = al[0] == 'Anonymous'
                        ? await OurDatabase().createIssueAnon(
                            _currentUser.getCurrentUser.uid, al, atl, ll)
                        : await OurDatabase().createIssue(
                            _currentUser.getCurrentUser.uid, al, atl, ll);
                    if (_returnString != "error") {
                      print('suc');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => (IssueFinal(
                                anon: al[0] == 'Anonymous',
                                rid: _returnString,
                              ))));
                    } else {
                      print(_returnString);
                    }
                  } catch (e) {
                    print(e);
                  }
                  print(al);
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
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          hoverColor: Colors.orange,
          onPressed: () {
            setState(() {
              openFileExplorer();
              print(fn);
            });
          },
          child: Icon(Icons.folder, color: Colors.orange),
        ),
      ),
    );
  }
}
