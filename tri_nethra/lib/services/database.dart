import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tri_nethra/models/user.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;
  Future<String> createUser(OurUser user) async {
    String retVal = "error";
    try {
      await _firestore.collection("users").document(user.uid).setData({
        'Legal Name': user.legalname,
        'Email': user.email,
        'Mobile': user.mobile,
        'password': user.password,
        'Doc Number': user.docNumber,
        'Doc type': user.docType,
        'Account created': Timestamp.now()
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  // Future<OurUser> getUserInfo(String uid) async {
  //   OurUser retVal = OurUser();
  //   try {
  //     DocumentSnapshot _docSnapshot =
  //         await _firestore.collection("users").document(uid).get();
  //     retVal.uid = uid;
  //     retVal.docNumber = _docSnapshot["Doc Number"];
  //     retVal.docType = _docSnapshot[""];
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }
}
