import 'package:app/common/config.dart';
import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:app/common/utils/optional.dart';

class PostFirebaseFireStoreRepo implements RepositoryInterface<UserPostModel> {
  PostFirebaseFireStoreRepo();

  @override
  Future<void> create(UserPostModel post) async {
    final docRef = firestore.collection(POST_COLLECTION).doc();
    final id = docRef.id;
    File file = new File(post.imagePath);
    String imageURL;
    //gotta get the image FILE to get the download
    //Image Path is only used by gallery, so we check if its empty so i does not conflict with url submission
    print("made it to PostFirebaseFireStore line 20?");
    if (post.imagePath.isEmpty) {
      print("Cannot handle both gallery and url store");
    } else {
      final imageRef = FirebaseStorage.instance
          .ref()
          .child('userPostImages')
          .child(id + '.jpg');
      await imageRef.putFile(file);
      imageURL = await imageRef.getDownloadURL();
      post = post.copyWith(imageUrl: imageURL);
    }

    print("made it to PostFirebaseFireStore line 30");
    post = post.copyWith(postId: id);
    print("made it to PostFirebaseFireStore");
    docRef.set(post.toMap());
    // TODO: Fix Image path
    // TODO: do verification on URL BLACK list of URL substrings, to validate image Machine learning
    //TODO: need to get User ID to append to postModel
    //TODO: why is is not getting POST id to append to jpg, is it because we set with postID and we need get it and append as well?
    //throw UnimplementedError();
  }

  @override
  Future<void> delete(String postId) async {
    
    await firestore.collection(POST_COLLECTION).doc(postId).delete();
    // TODO: implement delete
    //throw UnimplementedError();
  }

  @override
  Future<UserPostModel> read(String postId) async {
    final doc = await firestore.collection(POST_COLLECTION).doc(postId).get();
    final data = Optional.ofNullable(doc.data());
    if (data.isPresent()) {
      return UserPostModel.fromMap(data.get()!);
    }
    return Future.error('Data does not exist');
  }

  @override
  Future<void> update(UserPostModel post) async {
    firestore.collection(POST_COLLECTION).doc(post.userId).set(post.toMap());
    // TODO: implement update
    //throw UnimplementedError();
    
  }
}
