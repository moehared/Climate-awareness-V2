import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/material.dart';

class AccountFirebaseFireStoreRepo implements RepositoryInterface<UserModel> {
  AccountFirebaseFireStoreRepo();
  @override
  Future<void> create(UserModel user) async {
    firestore.collection(USER_COLLECTION).doc(user.userId).set(
          user.toMap(),
        );
  }

  @override
  Future<void> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserModel> read(String id) async {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(String id) async {
    final user = await read(id);
    firestore.collection(USER_COLLECTION).doc(id).set(user.toMap());
  }
}
