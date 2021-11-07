import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:flutter/cupertino.dart';

class ForumPostViewModel extends BaseViewModel{

UserPostModel _userPostModel = UserPostModel(
  userId: "",
  user: "",
  category: "",
  title: "",
  description: "",
  url: "",
  imageUrl: "",
  imagePath: "",
  type: ""
);

}