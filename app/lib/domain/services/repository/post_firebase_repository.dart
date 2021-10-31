import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class PostFirebaseFireStoreRepo implements RepositoryInterface<UserPostModel> {
  PostFirebaseFireStoreRepo();

  @override
  Future<void> create(UserPostModel data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(UserPostModel data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> read(UserPostModel data) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(UserPostModel data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
