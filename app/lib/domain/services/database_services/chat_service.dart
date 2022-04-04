import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/models/user_forum_model.dart';
//import 'package:app/domain/services/repository/forum_firebase_repository.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/chat_firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:flutter/foundation.dart';

class ChatDatabaseService {
  final ChatFirebaseFireStoreRepo _repository;
  ChatDatabaseService(this._repository);




  Future <String> create(ChatModel chatModel) async {
    return _repository.create(chatModel);
  }

  Future<bool> checkIfUserAlreadyHasChatRoom(String recieverId){
    return _repository.checkIfUserAlreadyHasChatRoom(recieverId);
  }
  Future<String> getChatModelFromCurrentUserAndRecieverId(String currentUId, String recieverId){
    return _repository.getChatModelFromCurrentUserAndRecieverId(currentUId, recieverId);
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

  Future<List<UserModel>> getUserModelBySearchByFirstName(String searchKey) async{
    return _repository.getUserModelBySearchKeyByFirstName(searchKey);
  }

  Future<List<ChatModel>> getChatModels(String currentUserId) async {
    return _repository.getChatModels(currentUserId);
  }

  void setSearchUserListResults( List<UserModel> searchResults){
      
      return _repository.setSearchUserListResults(searchResults);
  }

  List<UserModel> getSearchUserListResults() {
    return _repository.getSearchUserListResults();
  }


  void createNewMessage(MessageModel messageModel ) async{
    return _repository.createNewMessage(messageModel);
  }

  Future <String>getUserName(String chatId) async{
  return _repository.getUserNameFromChatModel(chatId);
  }

  Future<MessageModel> getRecentChatMessage(String chatId) async {
    try {
      return await _repository.getRecentChatMessage(chatId);
    } catch (e) {
      return Future.error('Recent chat Data does not exist');
    }
  }





}
