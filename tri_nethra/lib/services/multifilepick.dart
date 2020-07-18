import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tri_nethra/models/currentUser.dart';
import 'package:tri_nethra/screens/ChatInterface/FinalRegistered.dart';
import 'package:tri_nethra/screens/root.dart';
import 'package:tri_nethra/services/database.dart';

class MultiFilePick extends StatefulWidget {
  List<String> ll, al;
  MultiFilePick({this.al, this.ll});

  @override
  _MultiFilePickState createState() => _MultiFilePickState(al: al, ll: ll);
}

class _MultiFilePickState extends State<MultiFilePick> {
  List<String> atl = ['/'];
  List<String> ll, al;

  _MultiFilePickState({this.al, this.ll});
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
      _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
    } else {
      String fileName = _path.split('/').last;
      String filePath = _path;
      upload(fileName, filePath);
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
    return Scaffold(
        // has to return only the widget next while applying
        body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            onPressed: () {
              openFileExplorer();
            },
            child: Text('data ${_tasks.length}'),
          ),
          RaisedButton(
            onPressed: () async {
              try {
                CurrentUser _currentUser =
                    Provider.of<CurrentUser>(context, listen: false);
                print(_currentUser.getCurrentUser.uid);
                print(_currentUser.getCurrentUser.refId);
                String _returnString = await OurDatabase().createIssue(
                  _currentUser.getCurrentUser.uid,
                  al,
                  atl,
                  ll,
                );
                if (_returnString == "success") {
                  print('suc');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => (IssueFinal())));
                } else {
                  print(_returnString);
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text('next'),
          ),
        ],
      ),
    ));
  }
}
