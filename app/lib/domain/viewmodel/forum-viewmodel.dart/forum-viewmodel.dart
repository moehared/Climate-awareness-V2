import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
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

//User Forum Model
  UserForumModel _userForumModel = UserForumModel(
    forumId: "",
    userId: "",
    topic: "",
    title: "",
    description: "",
    url: "",
    imageUrl: "",
    imagePath: "",
    date: "",
  );



//Init states
  void initState(String forumId) async {
    if (forumId.isEmpty) {
      return;
    }
    _userForumModel = await _userForumService.fetchPostData(forumId);
    _urlController.text = _userForumModel.url;
    _descriptionController.text = _userForumModel.description;
    imagePathController.text = _userForumModel.imageUrl;
    notifyListeners();
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
    print(_validUrlPath);
    print(articleValid);
  }

  //forum Submit
  void submit() async {
    if (!_formKey.currentState!.validate() ||
        _image == null ||
        _imagePathController.text.isEmpty) {
      return;
    }

    _formKey.currentState?.save();
    final date = getCurrentDateFormat();
    setUserForumModel = userForumModel.copyWith(imagePath: _image!.path);
    setUserForumModel =
        userForumModel.copyWith(imageUrl: imagePathController.text);
    setUserForumModel = userForumModel.copyWith(date: date);
    setUserForumModel = userForumModel.copyWith(
        userId: _userAuthService.currentUser.get()?.uid);
    _userForumService.createNewForum(userForumModel);
    _navService.pop();
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
