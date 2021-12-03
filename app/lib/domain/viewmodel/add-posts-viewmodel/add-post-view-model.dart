import 'package:app/common/utils/regex-patterns.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/post_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/ui/views/add-post-view/addPost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:app/common/blacklist.dart';
import 'package:http/http.dart' as http;

//TODO: To seperate catergory and type create maybe another drop down widget
class AddPostViewModel extends BaseViewModel {
  var _validUrlPath = false;
  var _validImageUrlPath = false;
  final _navService = locator<NavigationService>();
  var _validImagePath = false;
  var _blackList = false;
  String _postId = "";

  var isEdit = false;

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

  void initState(AddPostData addPostData) async {
    if (addPostData.postId.isEmpty) {
      print('add post data id is null');
      return;
    }
    //   UserPostModel editPost =
    // await _userPostService.fetchPostData(addPostData.postId);
    _userPostModel = await _userPostService.fetchPostData(addPostData.postId);
    print('post id == ${_userPostModel.postId}');

    notifyListeners();
    print('post id in add post view model ${addPostData.postId}');
    print(
        'Some data from database about post ${_userPostModel.url} and ${_userPostModel.description}');

    _urlController.text = _userPostModel.url;
    _descriptionController.text = _userPostModel.description;
    _imageUrlController.text = _userPostModel.imageUrl;
    // dropDownValue = editPost.category;
  }

  Future<void> updatePost() async {
    //     final isValid = _formKey.currentState!.validate();
    //   if(!isValid) return ;
    final date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate =
        "${dateParse.day}-${dateParse.month}-${dateParse.year}-${dateParse.hour}-${dateParse.minute}-${dateParse.second}";
    _formKey.currentState?.save();
    _userPostModel = _userPostModel.copyWith(date: formattedDate);

    _userPostService.updatePost(_userPostModel);
    _navService.pop();
    _navService.pop();
  }

  void submit() async {
    final isValid = _formKey.currentState!.validate();
    final date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate =
        "${dateParse.day}-${dateParse.month}-${dateParse.year}-${dateParse.hour}-${dateParse.minute}-${dateParse.second}";

//if not valid print and return else create the post
    if (!isValid) {
      print("Not valid formKey");
      return;
    }
    //TODO: Clear forum once submitted, also give feedback either post failed or success
    if (_image != null) {
      setUserPostObj = userPostsModel.copyWith(imagePath: _image!.path);
    }
    if (_imageUrlController.text.isNotEmpty) {
      setUserPostObj = userPostsModel.copyWith(imageUrl: imageController.text);
    }

    _formKey.currentState?.save();
    setUserPostObj = userPostsModel.copyWith(date: formattedDate);
    setUserPostObj = userPostsModel.copyWith(
        userId: _userAuthService.currentUser.get()?.uid);
    _userPostService.createNewPost(userPostsModel);
    _navService.pop();
  }
}
