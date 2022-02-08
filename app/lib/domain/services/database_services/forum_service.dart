import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/services/repository/forum_firebase_repository.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class ForumDatabaseService {
  final ForumFirebaseFireStoreRepo _repository;
  ForumDatabaseService(this._repository);

  void createNewForum(UserForumModel userForumModel) async {
    _repository.create(userForumModel);
    //print(userPostModel.toMap().toString());
  }

  void delete(String postId) async {
    return await _repository.delete(postId);
  }

  Future<UserForumModel> fetchPostData(String postId) async {
    try {
      return await _repository.read(postId);
    } catch (e) {
      return Future.error('Post Data does not exist');
    }
  }

  Future<void> updatePost(UserForumModel post) async {
    await _repository.update(post);
  }



//Services for forum likes and comments 
  void likePost(String forumId) async {
    await _repository.incrementLikePost(forumId);
  }

  Future<void> dislikePost(String forumId) async {
    await _repository.decrementLikePost(forumId);
  }

  void createComment(UserFourmCommentModel userForumCommentModel) async {
    _repository.createComment(userForumCommentModel);
  }

  void deleteComment(String commentId, String forumId) async {
    return await _repository.deleteComment(commentId, forumId);
  }

  // Future<UserForumModel> readCommentModel(String forumId, String commentId) {
  //   return _repository.readCommentModel(forumId, commentId);
  // }


    Future<UserFourmCommentModel> fetchCommentData(String forumId, String commentId) async {
    try {
      return await _repository.readCommentModel(forumId,commentId);
    } catch (e) {
      return Future.error('Post Data does not exist');
    }
  }
}
