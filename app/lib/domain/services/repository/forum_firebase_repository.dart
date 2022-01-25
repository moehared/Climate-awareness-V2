import 'package:app/common/config.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';

class ForumFirebaseFireStoreRepo
    implements RepositoryInterface<UserForumModel> {
  ForumFirebaseFireStoreRepo();

  @override
  Future<void> create(UserForumModel forumPost) async {
    final docRef = firestore.collection(FORUM_COLLECTION).doc();
    final id = docRef.id;
    //gotta get the image FILE to get the download
    //Image Path is only used by gallery, so we check if its empty so i does not conflict with url submission
    // print("made it to PostFirebaseFireStore line 20?");
    // if (forumPost.imagePath.isEmpty) {
    //   print("Cannot handle both gallery and url store");
    // } else {
    //   final imageRef = FirebaseStorage.instance
    //       .ref()
    //       .child('userPostImages')
    //       .child(id + '.jpg');
    //   await imageRef.putFile(file);
    //   imageURL = await imageRef.getDownloadURL();
    //   forumPost = forumPost.copyWith(imageUrl: imageURL);
    // }
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

  Future<void> createComment(
      UserFourmCommentModel userFourmCommentModel) async {
    //This is creating a comment collection
    final docRef = firestore
        .collection(FORUM_COMMENT_COLLECTION)
        .doc(userFourmCommentModel.forumId);
    //TODO Rename the variable something
    final something = docRef.collection("comments").doc();
    final somethingId = something.id;
    print("This should be the omment collection ${somethingId}");
    userFourmCommentModel =
        userFourmCommentModel.copyWith(commentId: somethingId);
    print("made it to copying the id to comment model");
    something.set(userFourmCommentModel.toMap());
    final DocumentReference docCom = firestore
        .collection(FORUM_COLLECTION)
        .doc(userFourmCommentModel.forumId);
    docCom.update({"commentCount": FieldValue.increment(1)});
    //Create the document path using forum ID
  }

  Future<void> incrementLikePost(String forumId) async {
    //print("Liking ${userId}");
    final DocumentReference docRef = firestore.collection(FORUM_COLLECTION).doc(forumId);
    docRef.update({"likeCount": FieldValue.increment(1)});
  }

  Future<void> decrementLikePost(String forumId) async {
    final docRef = firestore.collection(FORUM_COLLECTION).doc(forumId);
    docRef.update({"likeCount": FieldValue.increment(-1)});
  }


  // Future<bool> checkIfLikedPost(UserForumModel forumPost) async {
  //   final docRef = firestore.collection(FORUM_COLLECTION).doc();
  //   if( )
  //   //if(userId == MapCheck(userID) if true ){return true }else: return false  
  //   docRef.update({"likeCount": FieldValue.increment(-1)});
  // }



}
