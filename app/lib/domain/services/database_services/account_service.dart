import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/repository/account_firebase_repository.dart';

class AccountDatabaseService {
  final AccountFirebaseFireStoreRepo _repository;
  AccountDatabaseService(this._repository);

  void createNewUser(UserModel userModel) async {
    _repository.create(userModel);
  }

  void updateUser(String id) async {
    return await _repository.update(id);
  }

  void deleteUser(String id) async {
    return await _repository.delete(id);
  }

  Future<UserModel> fetchUser(String id) async {
    return await _repository.read(id);
  }
}
