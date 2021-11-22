import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


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
    if(post.imagePath.isEmpty){
      print("Cannot handle both gallery and url store");
    }
    else{
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
