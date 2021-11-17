import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/post_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/domain/services/database_services/account_service.dart';

class ForumPostViewModel extends BaseViewModel {
  var _validUrlPath = false;
  var _validImagePath = false;
  var _uploadToFireBase = false;
  final _imageUrlController = TextEditingController();
  var errorUrl = false;
  var mediaError = false;
  var isUserUpload = false;

  File? _image;
 
  final _userAuthService = locator<AuthService>();
  final _userPostService = locator<PostDatabaseService>();

  final imagePicker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

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

  set setUserPostObj(UserPostModel copy) {
    _userPostModel = copy;
  }

  UserPostModel get userPostsModel => _userPostModel;

  GlobalKey<FormState> get formkey => _formKey;

  void submit() async {
    final isValid = _formKey.currentState!.validate();
    final date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}-${dateParse.hour}-${dateParse.minute}-${dateParse.second}";

//if not valid print and return else create the post
    if (!isValid) {
      print("Not valid formKEy");
      return;
    }
    //TODO: Clear forum once submitted, also give feedback either post failed or success
    if(_image != null){
    setUserPostObj = userPostsModel.copyWith(imagePath: _image?.path);  
    }
    if(_imageUrlController.text.isNotEmpty){
          setUserPostObj = userPostsModel.copyWith(imageUrl: imageController.text);  
    }

    _formKey.currentState?.save();
    setUserPostObj = userPostsModel.copyWith(date: formattedDate);
    setUserPostObj = userPostsModel.copyWith(userId: _userAuthService.currentUser.get()?.uid);
    
    _userPostService.createNewPost(userPostsModel);
  }

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
}
