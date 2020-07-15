import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tri_nethra/models/user.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;
  Future<String> createUser(OurUser user) async {
    String retVal = "error";
    try {
      List<String> s = List();

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
      retVal.RefId = _docSnapshot["RefId"];
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
}
