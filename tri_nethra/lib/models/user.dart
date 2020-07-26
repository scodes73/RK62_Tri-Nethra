import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String password;
  String mobile;
  String legalname;
  String docType;
  String docNumber;
  Timestamp accountCreated;
  List<String> refId;
  // bool isAnon;

  OurUser({
    this.uid,
    this.email,
    this.accountCreated,
    this.docNumber,
    this.docType,
    this.legalname,
    this.mobile,
    this.password,
    this.refId,
    // this.isAnon
  });
}
