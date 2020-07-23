import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:tri_nethra/models/Issue.dart';
import 'package:tri_nethra/models/user.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;
  Future<String> createUser(OurUser user) async {
    String retVal = "error";
    try {
      List<String> s = ['/'];

      await _firestore.collection("users").document(user.uid).setData({
        'Legal Name': user.legalname,
        'Email': user.email,
        'Mobile': user.mobile,
        'password': user.password,
        'Doc Number': user.docNumber,
        'Doc type': user.docType,
        'Account created': Timestamp.now(),
        'RefId': s
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").document(uid).get();
      retVal.uid = uid;
      retVal.docNumber = _docSnapshot["Doc Number"];
      retVal.docType = _docSnapshot["Doc type"];
      retVal.accountCreated = _docSnapshot["Account created"];
      retVal.legalname = _docSnapshot["Legal Name"];
      retVal.email = _docSnapshot["Email"];
      retVal.password = _docSnapshot["password"];
      retVal.mobile = _docSnapshot["Mobile"];
      retVal.refId = List<String>.from(_docSnapshot["RefId"]);
      print(retVal.refId);
      // dlist.Cast<string>().ToList();
      // var strings = dlist.Select(item => item?.ToString()).ToList();
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> createIssue(
      String userUid, List<String> al, List<String> fl, List<String> ll) async {
    String retVal = "error";
    List<String> issuesList = List();

    try {
      print(userUid);
      DocumentReference _docRef = await _firestore.collection("issues").add({
        'done by': userUid,
        'content list': al,
        'attachment list': fl,
        'location coordinates': ll,
        'issueCreate': Timestamp.now(),
        'status': 'Pending',
        'remarks': 'None'
      });
      issuesList.add(_docRef.documentID);

      await _firestore.collection("users").document(userUid).updateData({
        'RefId': FieldValue.arrayUnion(issuesList),
      });

      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurIssue> getIssueInfo(String rid) async {
    OurIssue retVal = OurIssue();
    try {
      print(rid);
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("issues").document(rid).get();
      if (_docSnapshot == null) {
        print('nulldox');
      }
      retVal.refNo = rid;
      retVal.status = _docSnapshot["status"];
      retVal.issueCreated = _docSnapshot["issueCreate"];
      retVal.doneBy = _docSnapshot["done by"];
      retVal.remarks = _docSnapshot["remarks"];
    } on PlatformException catch (e) {
      print(e);
      retVal.refNo = 'bad';
    } catch (e) {
      print('d');
      retVal.refNo = 'bad';
      print(e);
    }

    return retVal;
  }

  // Future<String> checkIssue(String rid) async {
  //   String retVal = "error";
  //   try {
  //     print(rid);
  //     DocumentSnapshot _docSnapshot =
  //         await _firestore.collection("issues").document(rid).get();

  //     retVal = "success";
  //   } on PlatformException catch (e) {
  //     retVal = "Make sure you have the right group ID!";
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }
}
