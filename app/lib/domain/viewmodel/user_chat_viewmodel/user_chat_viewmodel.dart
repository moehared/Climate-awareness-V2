import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';

class UserChatViewModel extends BaseViewModel{

  final _chatService = locator<ChatDatabaseService>();
  final _navService = locator<NavigationService>();
  final _accountService = locator<AccountDatabaseService>();
  final _userAuthService = locator<AuthService>();
  final _searchBarController = TextEditingController();
  final _searchHint = "Search..";
  final _errorMessage = "Nothing..";


  String get getSearchHint =>  _searchHint;
  String get getErrorMessage => _errorMessage;
  TextEditingController  get getSearchTextController => _searchBarController;



  Future <bool> createChatRoom(String sender, String reciever) async {
    sender = _userAuthService.currentUser.get()!.uid;
    var senderUserModel = await _accountService.fetchUserModel("YhQkbh2h4OfYExWYo8FWtcHKHUu1");
    var recieverUserModel = await  _accountService.fetchUserModel("omqSKhiBUQO9XeT5NhbeVMNwqDn2");
    ChatModel chatModel =  ChatModel(sender: senderUserModel, reciever: recieverUserModel, chatId: " ");
    _chatService.create(chatModel);
    print("Created chatroom");
    return true;
  }

  Stream getListOfUsers(String searchKey) {
    print("Am i getting called");
      return  _chatService.getListOfUsers(searchKey);
  }

  Future<List<UserModel>> getFilteredUsersBySearchKey(String searchKey){
    return _chatService.getUserModelBySearchByFirstName(searchKey);
  }
}