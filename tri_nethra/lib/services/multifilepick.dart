import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiFilePick extends StatefulWidget {
  @override
  _MultiFilePickState createState() => _MultiFilePickState();
}

class _MultiFilePickState extends State<MultiFilePick> {
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

  upload(fileName, filePath) {
    _extension = fileName.toString().split('.').last;
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(filePath),
      StorageMetadata(
        contentType: '$_pickType/$_extension',
      ),
    );
    setState(() {
      _tasks.add(uploadTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // has to return only the widget next while applying
        body: Center(
      child: RaisedButton(
        onPressed: () {
          openFileExplorer();
        },
        child: Text('data'),
      ),
    ));
  }
}
