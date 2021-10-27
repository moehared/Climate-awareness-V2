import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/repository/repo_interface.dart';

class PostDatabaseService {
  final RepositoryInterface<UserPostModel> repository;
  PostDatabaseService(this.repository);
}
