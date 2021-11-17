import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class PostDatabaseService {
  final RepositoryInterface<UserPostModel> repository;
  PostDatabaseService(this.repository);


  void createNewPost(UserPostModel userPostModel) async{
    repository.create(userPostModel);
    //print(userPostModel.toMap().toString());
  }

}
