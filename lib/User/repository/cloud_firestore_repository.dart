import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips/User/repository/cloud_firestore_api.dart';
import '../model/user.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserL user) {
    _cloudFirestoreAPI.updateUserData(user);
  }
}
