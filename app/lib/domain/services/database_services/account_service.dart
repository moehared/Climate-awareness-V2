import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/repository/account_firebase_repository.dart';

class AccountDatabaseService {
  final AccountFirebaseFireStoreRepo _repository;
  AccountDatabaseService(this._repository);

  void createNewUser(UserModel userModel) async {
    _repository.create(userModel);
  }

  void updateUser(UserModel userModel) async {
    return await _repository.update(userModel);
  }

  void deleteUser(UserModel userModel) async {
    return await _repository.delete(userModel);
  }

  void fetchUser(UserModel userModel) async {
    return await _repository.read(userModel);
  }
}
