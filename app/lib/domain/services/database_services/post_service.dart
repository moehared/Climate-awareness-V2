import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/post_firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class PostDatabaseService {
  final PostFirebaseFireStoreRepo _repository;
  PostDatabaseService(this._repository);

  Future <void> createNewPost(UserPostModel userPostModel) async {
    await _repository.create(userPostModel);
    //print(userPostModel.toMap().toString());
  }

  void delete(String postId) async {
    return await _repository.delete(postId);
  }

  Future<UserPostModel> fetchPostData(String postId) async {
    try {
      return await _repository.read(postId);
    } catch (e) {
      return Future.error('Post Data does not exist');
    }
  }

  Future<void> updatePost(UserPostModel post) async {
    await _repository.update(post);
  }
}
