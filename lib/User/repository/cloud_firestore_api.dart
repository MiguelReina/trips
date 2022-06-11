import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String ALARMS = "alarms";
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(UserL user) async {
    //CollectionReference users = _db.collection(USERS);
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'alarm': user.myAlarm,
      'lastSignIn': DateTime.now(),
    });
  }
}
