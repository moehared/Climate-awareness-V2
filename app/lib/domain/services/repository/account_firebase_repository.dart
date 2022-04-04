import 'package:app/common/config.dart';
import 'package:app/common/constant.dart';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<UserModel> read(String id) async {
    final doc = await firestore.collection(USER_COLLECTION).doc(id).get();
    final data = Optional.ofNullable(doc.data());
    if (data.isPresent()) {
      return UserModel.fromMap(data.get()!);
    }
    return Future.error('Data does not exist');
  }

  @override
  Future<void> update(UserModel user) async {
    await firestore
        .collection(USER_COLLECTION)
        .doc(user.userId)
        .set(user.toMap());
  }


  @override
  Future<void> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
