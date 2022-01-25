import 'package:app/common/blacklist.dart';
import 'package:app/common/utils/date_format.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/database_services/forum_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';

class ExpandedForumViewModel extends BaseViewModel {
  final _userForumService = locator<ForumDatabaseService>();
  final _navService = locator<NavigationService>();
  final _accountService = locator<AccountDatabaseService>();
  final _userAuthService = locator<AuthService>();
  final _commentController = TextEditingController();
  var _blackList = false;
  var formId = "";
  bool isLikePressed = false;
//Form Key
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formKey;

  //textEditingController
  TextEditingController get commentContoller => _commentController;

  //getters
  bool get blackListValidator => _blackList;

  UserForumModel _userForumModel = UserForumModel(
    forumId: "",
    userId: "",
    userDisplayName: "",
    topic: "",
    title: "",
    description: "",
    url: "",
    imageUrl: "",
    imagePath: "",
    likeCount: "",
    commentCount: "",
    userLikePost: {},
    date: "",
  );

  UserFourmCommentModel _userForumCommentmodel = UserFourmCommentModel(
      forumId: " ",
      commentId: "",
      userId: "",
      userName: " ",
      userComment: "",
      date: " ");

  void initState(String forumId) async {
    if (forumId.isEmpty) {
      return;
    }
    print("This is the forumId Hello ${forumId}");
    _userForumModel = await _userForumService.fetchPostData(forumId);
    setUserCommentModel = userCommentModel.copyWith(forumId: forumId);
    print(
        "This is the forumId Saved to comment model ${userCommentModel.forumId}");
    notifyListeners();
  }

//getters
  UserForumModel get userForumModel => _userForumModel;
  UserFourmCommentModel get userCommentModel => _userForumCommentmodel;

// setter for Comments
  set setUserCommentModel(UserFourmCommentModel copy) {
    _userForumCommentmodel = copy;
    notifyListeners();
  }
  set setUserForumModel(UserForumModel copy){
    _userForumModel = copy;
    notifyListeners();
  }

  void likedPost() {
    final currentUser = _userAuthService.currentUser.get()?.uid;
    if(currentUser == null){
      return ;
    }
    isLikePressed = true; 
    setUserForumModel = userForumModel.copyWith(userLikePost: {currentUser: true});
    _userForumService.updatePost(userForumModel);
    _userForumService.likePost(userForumModel.forumId);
  }

  void dislikePost(){
       final currentUser = _userAuthService.currentUser.get()?.uid;
    if (currentUser == null) {
      return;
     
    }
     isLikePressed = false;
     setUserForumModel = userForumModel.copyWith(userLikePost:{});
     _userForumService.updatePost(userForumModel);
     _userForumService.dislikePost(userForumModel.forumId);
  }

  void blacklistCheck(String userInput) async {
    for (var i = 0; i < blackList.length; i++) {
      if (userInput.contains(blackList[i])) {
        _blackList = true;
      }
    }
    notifyListeners();
  }

  void clearCommentTextField() {
    commentContoller.clear();
    notifyListeners();
  }

  bool isLikedPost(){
    return userForumModel.userLikePost!.containsKey(_userAuthService.currentUser.get()?.uid);
  }

  //submit Commenter
  void submit() async {
    print("Did i Make liune 135");
    if (!_formKey.currentState!.validate()) {
      print("could not submit");
      return;
    }
    print("did i make it here?");
    _formKey.currentState?.save();
    final date = getCurrentDateFormat();
    setUserCommentModel = userCommentModel.copyWith(date: date);
    setUserCommentModel = userCommentModel.copyWith(
        userId: _userAuthService.currentUser.get()?.uid,
        userName: _userAuthService.currentUser.get()!.displayName);

    print('This is the current comment ${userCommentModel.userComment}');
    _userForumService.createComment(userCommentModel);
    clearCommentTextField();
    print("This is the comment count${userForumModel.commentCount}");
    // _navService.pop();
    // print("pop service?");
  }
}
