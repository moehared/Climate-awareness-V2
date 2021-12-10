import 'package:app/common/utils/date_format.dart';
import 'package:app/common/utils/regex-patterns.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/post_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:app/common/blacklist.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

//TODO: To seperate catergory and type create maybe another drop down widget
class AddPostViewModel extends BaseViewModel {
  var _validUrlPath = false;
  var _validImageUrlPath = false;
  final _navService = locator<NavigationService>();
  var _validImagePath = false;
  var _blackList = false;
  String _postId = "";

  var _isEdit = false;

  bool get isEdit => _isEdit;

  final _imageUrlController = TextEditingController();
  final _urlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  var errorUrl = false;
  var mediaError = false;
  var isUserUpload = false;
  final _imageURLFocusNode = FocusNode();
  FocusNode get imageURLFocusNode => _imageURLFocusNode;
  File? _image;
  String dropDownValue = 'Select Category';
  final imagePicker = ImagePicker();

  final _userAuthService = locator<AuthService>();
  final _userPostService = locator<PostDatabaseService>();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formKey;

  UserPostModel _userPostModel = UserPostModel(
      postId: "",
      userId: "",
      category: "",
      description: "",
      url: "",
      imageUrl: "",
      imagePath: "",
      type: "",
      date: "");

  File? get image => _image;

  TextEditingController get imageController => _imageUrlController;
  TextEditingController get urlController => _urlController;
  TextEditingController get descriptionContoller => _descriptionController;
  TextEditingController get categoryController => _categoryController;

  List<String> get categoryList =>
      ['Environment', 'Climate Awareness', 'Media', 'Article'];

  set setUserPostObj(UserPostModel copy) {
    _userPostModel = copy;
    notifyListeners();
  }

  UserPostModel get userPostsModel => _userPostModel;

  void onEditComplete() {
    isUserUpload = false;
    notifyListeners();
  }

  //TODO: Scalability of thie blacklist, if moderators want to add to this black list
  void blacklistCheck(String userInput) async {
    for (var i = 0; i < blackList.length; i++) {
      if (userInput.contains(blackList[i])) {
        _blackList = true;
      }
    }
    notifyListeners();
  }

  bool get blackListValid => _blackList;

  //TODO: One validator is for http|https and another is for images .png , jpeg

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
                null ||
            RegExp(youtubePattern, caseSensitive: false)
                    .firstMatch(userArticleUrl) !=
                null);

    if (isUrlValid) {
      _validUrlPath = true;
    } else {
      _validUrlPath = false;
    }
    print(_validUrlPath);
    print(articleValid);
  }

  bool get articleValid => _validUrlPath;

  void checkImageURL(String userImageUrl) {
    try {
      final response = http.get(Uri.parse(userImageUrl));
      if (response == 200) {
        _validUrlPath = true;
      }
    } on Exception catch (_) {
      _validUrlPath = false;
    }
    print(_validImageUrlPath);
    var isUrlValid =
        (RegExp(imagePattern, caseSensitive: false).firstMatch(userImageUrl) !=
            null);

    if (isUrlValid) {
      _validImageUrlPath = true;
    } else {
      _validImageUrlPath = false;
    }
    print(_validImageUrlPath);
    print(imageValid);
  }

  bool get imageValid => _validImageUrlPath;

//TODO: To validate images need to make machine learning
// TODO: need to also validate image url
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _image = File(image.path);
      isUserUpload = true;
      setUserPostObj = userPostsModel.copyWith(imagePath: image.path);
      notifyListeners();
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  bool get imageUpload => isUserUpload;

  void initState(String postId) async {
    if (postId.isEmpty) {
      return;
    }
    _userPostModel = await _userPostService.fetchPostData(postId);
    _urlController.text = _userPostModel.url;
    _descriptionController.text = _userPostModel.description;
    _imageUrlController.text = _userPostModel.imageUrl;
    notifyListeners();
  }

  Future<void> updatePost() async {
    if (!_formKey.currentState!.validate()) return;
    String date = getCurrentDateFormat();
    _formKey.currentState?.save();
    _userPostModel = _userPostModel.copyWith(date: date);
    _userPostService.updatePost(_userPostModel);
    // pop edit screen
    _navService.pop();
    // pop edit pop up menu bottom sheet modal
    _navService.pop();
  }

  void submit() async {
    if (!_formKey.currentState!.validate() ||
        _image == null ||
        _imageUrlController.text.isEmpty) {
      return;
    }

    _formKey.currentState?.save();
    final date = getCurrentDateFormat();
    setUserPostObj = userPostsModel.copyWith(imagePath: _image!.path);
    setUserPostObj = userPostsModel.copyWith(imageUrl: imageController.text);
    setUserPostObj = userPostsModel.copyWith(date: date);
    setUserPostObj = userPostsModel.copyWith(
        userId: _userAuthService.currentUser.get()?.uid);
    _userPostService.createNewPost(userPostsModel);
    _navService.pop();
  }

  void eventEmitted(bool edit) {
    this._isEdit = edit;
    notifyListeners();
  }
}
