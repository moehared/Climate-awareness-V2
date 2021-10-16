import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class FirebaseFireStoreRepo implements RepositoryInterface {
  final FirebaseFirestore _firestore;
  FirebaseFireStoreRepo(this._firestore);

  @override
  Future<void> deleteAccount(String userId) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> setNewAccount(UserModel user) {
    // TODO: implement setNewAccount
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserAccount(UserModel user) {
    // TODO: implement updateUserAccount
    throw UnimplementedError();
  }
}
