import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/post_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:app/domain/services/database_services/account_service.dart';




class ForumPostViewModel extends BaseViewModel{
  var _validUrlPath = false;
  var _validImagePath = false;
  var _uploadToFireBase = false;
  var errorUrl = false;
  var mediaError = false;

  File ? file;

  final _userAuthService = locator<AuthService>();
  final _userPostService = locator<PostDatabaseService>();


  final _formKey = GlobalKey<FormState>();

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false );
    if(result == null)return;
    final path = result.files.single.path!;
    file = File(path);
    if(file == null)return "Add a image";
  }

  Future uploadFile() async{
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'Path To firebase/$fileName';
  }


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

  set setUserPostObj(UserPostModel copy) {
    _userPostModel = copy;
  }


  UserPostModel get userPostsModel =>  _userPostModel;

    


 GlobalKey<FormState> get formkey => _formKey;

  void submit(context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
 //   _userPostService.createNewPost(userPostModel)
  }







}