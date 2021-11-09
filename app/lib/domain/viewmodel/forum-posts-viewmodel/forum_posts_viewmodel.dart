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



class ForumPostViewModel extends BaseViewModel{
  var _validURLPath = false;
  var _validImagePath = false;
  var _uploadToFireBase = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String myId = '';
  String myUsername = '';
  //check if user is signed in get instance 
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formkey => _formKey;


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




void getUserData() async{
  if( _firebaseAuth.currentUser == null) return;
  User ? user = _firebaseAuth.currentUser;
  FirebaseFirestore.instance.collection('user').doc(user?.uid).snapshots().listen( (userdata){ 


    });
   }

}
