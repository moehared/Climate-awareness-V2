import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class PostFirebaseFireStoreRepo implements RepositoryInterface<UserPostModel> {
  PostFirebaseFireStoreRepo();

  @override
  Future<void> create(UserPostModel post) async {
    //  final docRef = firestore.collection(POST_COLLECTION).doc();
//   final id = docRef.id;
<<<<<<< Updated upstream
    //  post = post.copyWith(postID: id);
    //   docRef.set(post.toMap());
    //   print('post id: $id');
=======
 //  post = post.copyWith(postID: id);
 //   docRef.set(post.toMap());

 //   print('post id: $id');
 throw UnimplementedError();
>>>>>>> Stashed changes
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
