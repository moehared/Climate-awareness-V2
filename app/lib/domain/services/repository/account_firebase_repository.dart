import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class AccountFirebaseFireStoreRepo implements RepositoryInterface<UserModel> {
  AccountFirebaseFireStoreRepo();
  @override
  Future<void> create(UserModel user) async {
    firestore.collection(USER_COLLECTION).doc(user.userId).set(
          user.toMap(),
        );
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
  Future<void> update(UserModel user) async {
    firestore.collection(USER_COLLECTION).doc(user.userId).set(user.toMap());
  }
}
