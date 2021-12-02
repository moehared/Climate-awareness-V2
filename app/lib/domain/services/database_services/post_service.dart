import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/post_firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class PostDatabaseService {
  final PostFirebaseFireStoreRepo repository;
  PostDatabaseService(this.repository);

  void createNewPost(UserPostModel userPostModel) async {
    repository.create(userPostModel);
    //print(userPostModel.toMap().toString());
  }

  void delete(String postId) async {
    return await repository.delete(postId);
  }

  
  Future<UserPostModel> fetchPostData(String postId) async {
    try {
      return await repository.read(postId);
    } catch (e) {
      return Future.error('Post Data does not exist');
    }
  }
}
