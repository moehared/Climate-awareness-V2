import 'package:app/common/config.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';

class ForumFirebaseFireStoreRepo implements RepositoryInterface<UserForumModel> {
  ForumFirebaseFireStoreRepo();

  @override
  Future<void> create(UserForumModel forumPost) async {
    final docRef = firestore.collection(FORUM_COLLECTION).doc();
    final id = docRef.id;
    File file = new File(forumPost.imagePath);
    String imageURL;
    //gotta get the image FILE to get the download
    //Image Path is only used by gallery, so we check if its empty so i does not conflict with url submission
    print("made it to PostFirebaseFireStore line 20?");
    if (forumPost.imagePath.isEmpty) {
      print("Cannot handle both gallery and url store");
    } else {
      final imageRef = FirebaseStorage.instance
          .ref()
          .child('userPostImages')
          .child(id + '.jpg');
      await imageRef.putFile(file);
      imageURL = await imageRef.getDownloadURL();
      forumPost = forumPost.copyWith(imageUrl: imageURL);
    }

    print("made it to PostFirebaseFireStore line 30");
    forumPost = forumPost.copyWith(forumId: id);
    print("made it to PostFirebaseFireStore");
    docRef.set(forumPost.toMap());
    // TODO: Fix Image path
    // TODO: do verification on URL BLACK list of URL substrings, to validate image Machine learning
    //TODO: need to get User ID to append to postModel
    //TODO: why is is not getting POST id to append to jpg, is it because we set with postID and we need get it and append as well?
    //throw UnimplementedError();
  }

  @override
  Future<UserForumModel> read(String forumId) async {
    final doc = await firestore.collection(FORUM_COLLECTION).doc(forumId).get();
    final data = Optional.ofNullable(doc.data());
    if (data.isPresent()) {
      return UserForumModel.fromMap(data.get()!);
    }
    return Future.error('Data does not exist');
  }

  @override
  Future<void> update(UserForumModel forumPost) async {
    print('post data map: ${forumPost.toMap()}');
    await firestore
        .collection(FORUM_COLLECTION)
        .doc(forumPost.forumId)
        .set(forumPost.toMap());
    // TODO: implement update
    //throw UnimplementedError();
  }

  @override
  Future<void> delete(String forumId) async {
    await firestore.collection(FORUM_COLLECTION).doc(forumId).delete();
    // TODO: implement delete
    //throw UnimplementedError();
  }

  @override
  Future<void> createComment(UserFourmCommentModel userFourmCommentModel ) async {
    final docRef = firestore.collection(FORUM_COLLECTION).doc();
    
    docRef.set(userFourmCommentModel.toMap());
  }

  @override
  Future <void> likePost(String postID) async {
    final docRef = firestore.collection(FORUM_COLLECTION).doc();

  }

}
