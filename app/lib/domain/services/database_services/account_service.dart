import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class AccountDatabaseService {
  final RepositoryInterface<UserModel> repository;
  AccountDatabaseService(this.repository);

  void createNewUser() {}
}
