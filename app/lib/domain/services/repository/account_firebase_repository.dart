import 'package:app/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class AccountFirebaseFireStoreRepo implements RepositoryInterface<UserModel> {
  AccountFirebaseFireStoreRepo();

  @override
  Future<void> create(UserModel data) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(UserModel data) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> read(UserModel data) async {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(UserModel data) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
