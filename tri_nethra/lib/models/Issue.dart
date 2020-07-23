import 'package:cloud_firestore/cloud_firestore.dart';

class OurIssue {
  String refNo;
  String doneBy;
  List<String> attachments;
  List<String> contents;
  List<String> loc;
  Timestamp issueCreated;
  String status;
  String remarks;
  OurIssue(
      {this.refNo,
      this.attachments,
      this.contents,
      this.doneBy,
      this.issueCreated,
      this.loc,
      this.status,
      this.remarks});
}
