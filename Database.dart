import "package:cloud_firestore/cloud_firestore.dart";
class DatabaseService {


  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference UserData = Firestore.instance.collection("Users");

  Future<void> updateUserData(String Reviews) async {
    return await UserData.document(uid).setData({
      "Reviews":Reviews,
    });
  }

}