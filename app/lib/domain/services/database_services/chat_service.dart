import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/user_forum_model.dart';
//import 'package:app/domain/services/repository/forum_firebase_repository.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/services/repository/chat_firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class ChatDatabaseService {
  final ChatFirebaseFireStoreRepo _repository;
  ChatDatabaseService(this._repository);


  Future <void> create(ChatModel chatModel) async {
    return _repository.create(chatModel);
  }
  
  void delete(String chatId) async {
    return await _repository.delete(chatId);
  }
  
  Future <void> update(ChatModel chatModel) async{
     await _repository.update(chatModel);

  }

  Future<ChatModel> fetchModel(String chatId) async  {
    try {
      return await _repository.read(chatId);
    } catch (e) {
      return Future.error('Post Data does not exist');
    }
  } 

  Stream getListOfUsers(String searchKey)  {
    try {
      return  _repository.getListOfUsers(searchKey);
    }catch(e){
       return Stream.error(e);
    }
  }

  Future<List> getData(String something ) async{
    return _repository.getData(something);
  }


  
}
