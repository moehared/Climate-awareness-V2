import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/repository/account_firebase_repository.dart';

class AccountDatabaseService {
  final AccountFirebaseFireStoreRepo _repository;
  AccountDatabaseService(this._repository);

  void createNewUser(UserModel userModel) async {
    _repository.create(userModel);
  }

  Future<void> updateUser(UserModel user) async {
    return await _repository.update(user);
  }

  void deleteUser(String id) async {
    return await _repository.delete(id);
  }

  Future<UserModel> fetchUserModel(String userId) async {
    try {
      return await _repository.read(userId);
    } catch (e) {
      return Future.error('Data does not exist');
    }
  }
}
