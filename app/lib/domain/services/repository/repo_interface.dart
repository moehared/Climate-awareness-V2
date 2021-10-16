import 'package:app/domain/models/user_model.dart';

// this class must be implemented by concrete classess
abstract class RepositoryInterface {
  Future<void> setNewAccount(UserModel user);
  Future<void> updateUserAccount(UserModel user);
  Future<void> deleteAccount(final String userId);

  //TODO: more repository interface api such as adding user post, fetching posts , etc

}
