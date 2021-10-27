import 'package:app/domain/models/user_model.dart';

// this class must be implemented by concrete classess
abstract class RepositoryInterface<T> {
  Future<void> delete(T data);
  Future<void> read(T data);
  Future<void> update(T data);
  Future<void> create(T data);

  //TODO: more repository interface api such as adding user post, fetching posts , etc

}
