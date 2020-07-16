import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tri_nethra/screens/TestScreens/uploader.dart';

/// Widget to capture and crop the image
class ImgCapScr extends StatefulWidget {
  createState() => _ImgCapScrState();
}

class _ImgCapScrState extends State<ImgCapScr> {
  /// Active image file
  File _imageFile;

  //Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      // maxWidth: 512,
      // maxHeight: 512,
      // toolbarColor: Colors.purple,
      // toolbarWidgetColor: Colors.white,
      // toolbarTitle: 'Crop It'
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  // void _clear() {
  //   setState(() => _imageFile = null);
  // }

  upload(File file) {
    String filePath = 'images/${DateTime.now()}.png';
    // _extension = fileName.toString().split('.').last;
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child(filePath);
    final StorageUploadTask uploadTask = storageRef.putFile(file);
    // setState(() {
    //   _tasks.add(uploadTask);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            // Row(
            //   children: <Widget>[
            //     FlatButton(
            //       child: Icon(Icons.crop),
            //       onPressed: _cropImage,
            //     ),
            //     FlatButton(
            //       child: Icon(Icons.refresh),
            //       onPressed: _clear,
            //     ),
            //   ],
            // ),
            Uploader(file: _imageFile)
            // RaisedButton(
            //     onPressed: () {
            //       upload(_imageFile);
            //     },
            //     child: Text('uf'))
          ]
        ],
      ),
    );
  }
}
