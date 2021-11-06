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
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserPostModel> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(UserPostModel post) {
    // TODO: implement update
    throw UnimplementedError();
  }

  
}
