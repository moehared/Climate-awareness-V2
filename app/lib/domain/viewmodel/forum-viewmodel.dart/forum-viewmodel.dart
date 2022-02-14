import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/local_db/share_pref/share_pref.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/ui/views/forum-view/add-forum-view.dart';
import 'package:app/ui/views/profile-view/profile-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/common/blacklist.dart';
import 'package:http/http.dart' as http;
import 'package:app/common/utils/regex-patterns.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/forum_service.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/common/utils/date_format.dart';
import 'dart:io';

class ForumViewModel extends BaseViewModel {
  //private variables
  File? _image;
  var _userFirstName = "";
  var _userLastName = "";
  final _auth = locator<AuthService>();

  //Check variables
  var _blackList = false;
  var _isEdit = false;
  var _validUrlPath = false;

  List<String> get topicList =>
      ['Environment', 'Climate Awareness', 'Help', 'Other'];

//Form Key
  final _formKey = GlobalKey<FormState>();

//Final variables
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _topicController = TextEditingController();
  final _urlController = TextEditingController();
  final _imagePathController = TextEditingController();
  final _userAuthService = locator<AuthService>();
  final _userForumService = locator<ForumDatabaseService>();
  final _navService = locator<NavigationService>();
  final _accountService = locator<AccountDatabaseService>();

//Text Editing Controller Getters
  TextEditingController get titleContoller => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get topicController => _topicController;
  TextEditingController get urlController => _urlController;
  TextEditingController get imagePathController => _imagePathController;
  GlobalKey<FormState> get formkey => _formKey;

//Getters
  bool get blackListValidator => _blackList;
  bool get isEdit => _isEdit;
  bool get articleValid => _validUrlPath;
  File? get image => _image;
  Future<UserModel> getUserModel(String uid) =>
      _accountService.fetchUserModel(uid);

  Future<UserModel> getUserFirstName(String uid) {
    String? uid = _userAuthService.currentUser.get()?.uid;
    return getUserModel(uid!);
  }

//User Forum Model
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

  void navigateToAddPostView() {
    _navService.navigateTo(AddForumView.routeName, argument: '');
  }

//Init states
  void initState() async {
    // if (forumId.isEmpty) {
    //   return;
    // }
    loadImage();
    // _userForumModel = await _userForumService.fetchPostData(forumId);
    _urlController.text = _userForumModel.url;
    _descriptionController.text = _userForumModel.description;
    imagePathController.text = _userForumModel.imageUrl;
    notifyListeners();
  }

// TODO: load images for each user individually. We might have to store user image in firebase instead of locally
  void loadImage() async {
    if (!_auth.currentUser.isPresent()) return;
    final uuid = _auth.currentUser.get()!.uid;
    final imagePath = await SharePref.getData(ProfileViewModel.IMAGE_KEY,uuid) ?? null;

    if (imagePath != null) {
      _image = File(imagePath);
      notifyListeners();
    }

  }

//User Forum Getter
  UserForumModel get userForumModel => _userForumModel;
//User Forum Setter
  set setUserForumModel(UserForumModel copy) {
    _userForumModel = copy;
    notifyListeners();
  }

  //Edit Forum event emmiter
  void eventEmitted(bool edit) {
    this._isEdit = edit;
    notifyListeners();
  }

  //Validators
  void blacklistCheck(String userInput) async {
    for (var i = 0; i < blackList.length; i++) {
      if (userInput.contains(blackList[i])) {
        _blackList = true;
      }
    }
    notifyListeners();
  }

  void checkArticleURL(String userArticleUrl) {
    try {
      final response = http.get(Uri.parse(userArticleUrl));
      if (response == 200) {
        _validUrlPath = true;
      }
    } on Exception catch (_) {
      _validUrlPath = false;
    }
    var isUrlValid =
        (RegExp(urlPattern, caseSensitive: false).firstMatch(userArticleUrl) !=
            null);

    if (isUrlValid) {
      _validUrlPath = true;
    } else {
      _validUrlPath = false;
    }
    print("userArticleURL $userArticleUrl");
    print("This is _validURL $_validUrlPath");
    print("This is articleValid $articleValid");
  }

  //forum Submit
  void submit() async {
    print("Did i Make liune 135");
    if (!_formKey.currentState!.validate()) {
      print("could not submit");
      return;
    }
    print("did i make it here?");
    _formKey.currentState?.save();
    final date = getCurrentDateFormat();
    // setUserForumModel = userForumModel.copyWith(imagePath: _image!.path);
    // setUserForumModel =
    //     userForumModel.copyWith(imageUrl: imagePathController.text);
    setUserForumModel = userForumModel.copyWith(date: date);
    setUserForumModel = userForumModel.copyWith(
        userId: _userAuthService.currentUser.get()?.uid,
        userDisplayName: _userAuthService.currentUser.get()!.displayName);
    _userForumService.createNewForum(userForumModel);
    _navService.pop();
    print("pop service?");
  }

  Future<void> updatePost() async {
    if (!_formKey.currentState!.validate()) return;
    String date = getCurrentDateFormat();
    _formKey.currentState?.save();
    _userForumModel = _userForumModel.copyWith(date: date);
    _userForumService.updatePost(_userForumModel);
    // pop edit screen
    _navService.pop();
    // pop edit pop up menu bottom sheet modal
    _navService.pop();
  }
}
