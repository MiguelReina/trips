import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/repository/cloud_firestore_repository.dart';
import '../repository/auth_repository.dart';
import '../model/user.dart';

class BlocUser implements Bloc {
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();

  //SignIn con Google
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  //Flujo de datos
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  //SignOut de Google
  // ignore: non_constant_identifier_names
  SignOut() => _auth_repository.signOut();

  //Registro de usuarios en la bdd
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(UserL user) {
    _cloudFirestoreRepository.updateUserDataFirestore(user);
  }

  @override
  void dispose() {}
}
