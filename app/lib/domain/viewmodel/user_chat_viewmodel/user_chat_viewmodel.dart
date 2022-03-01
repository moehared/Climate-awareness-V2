import 'package:app/common/utils/date_format.dart';
import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/chat-view/message-view.dart';
import 'package:flutter/material.dart';

class UserChatViewModel extends BaseViewModel {
  final _chatService = locator<ChatDatabaseService>();
  final _navService = locator<NavigationService>();
  final _accountService = locator<AccountDatabaseService>();
  final _userAuthService = locator<AuthService>();
  final _searchBarController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _searchHint = "Search..";
  final _errorMessage = "Nothing..";

  List<UserModel> _somedata = [];
  set setSomeData(List<UserModel> copy) {
    _somedata = copy;
    notifyListeners();
  }

  List<UserModel> get getSomeData => _somedata;

  String get getSearchHint => _searchHint;
  String get getErrorMessage => _errorMessage;
  TextEditingController get getSearchTextController => _searchBarController;
  TextEditingController get getMessageController => _messageController;

  GlobalKey<FormState> get formkey => _formKey;

  void initState({String searchKey = '', String chatId = ""}) async {
    _chatModel = await _chatService.fetchModel(chatId);
    // check if sender recieer is sending message
    //check current uid to chatModel.sender Uid if different then change to reciever else sender
    if (_userAuthService.currentUser.get()!.uid == _chatModel.sender.userId) {
      setMessageModel = await messageModel.copyWith(sender: _chatModel.sender);
    }
    else
    {
      setMessageModel = await messageModel.copyWith(sender: _chatModel.reciever);
    }
    //setMessageModel = await messageModel.copyWith(sender: _chatModel.sender);
    setChatModel = chatModel.copyWith(chatId: chatId);
    getListOfUsers(searchKey);
    notifyListeners();
  }

  String getUserName(){
    if (locator<AuthService>().currentUser.get()!.uid ==
        chatModel.reciever.userId) {
      return "${chatModel.sender.firstName} ${chatModel.sender.lastName}";
    } else {
      return "${chatModel.reciever.firstName} ${chatModel.reciever.lastName}";
    }
  }

  void navigateToDirectMessage(String chatId) {
    _navService.navigateTo(MessageView.routeName, argument: chatId);
  }

  String get getUserId => _userAuthService.currentUser.get()!.uid;

//TODO move this to a service
  Future<bool> createChatRoom(String recieverId) async {
    var senderId = _userAuthService.currentUser.get()!.uid;
    if (recieverId == senderId) {
      print("Same Person");
      return false;
    }
    var senderUserModel = await _accountService.fetchUserModel(senderId);
    var recieverUserModel = await _accountService.fetchUserModel(recieverId);
    ChatModel chatModel = ChatModel(
        sender: senderUserModel, reciever: recieverUserModel, chatId: " ");
    var createdChatId = await _chatService.create(chatModel);
    print("Created chatroom with id: ${createdChatId}");
    navigateToDirectMessage(createdChatId);
    return true;
  }

  Stream getListOfUsers(String searchKey) {
    print("Am i getting called");
    return _chatService.getListOfUsers(searchKey);
  }

  Future<List<UserModel>> getFilteredUsersBySearchKey(String searchKey) async {
    return _chatService.getUserModelBySearchByFirstName(searchKey);
  }

  Future<bool> checkChatId(String chatId) async {
    ChatModel chatModel = await _chatService.fetchModel(chatId);
    return chatModel == chatModel.chatId ? true : false;
  }

  //Chat UI Main page create cards for this
  Future<List<ChatModel>> getMyChats(String currentUserId) async {
    return _chatService.getChatModels(currentUserId);
  }

  ChatModel _chatModel = ChatModel(
      sender: UserModel(
          userId: "",
          firstName: "",
          lastName: "",
          password: "",
          email: "",
          phoneNumber: "",
          dateCreated: ""),
      reciever: UserModel(
          userId: "",
          firstName: "",
          lastName: "",
          password: "",
          email: "",
          phoneNumber: "",
          dateCreated: ""),
      chatId: "");

  //functions for messages

  MessageModel _messageModel = MessageModel(
      sender: UserModel(
          userId: "",
          firstName: "",
          lastName: "",
          password: "",
          email: "",
          phoneNumber: "",
          dateCreated: ""),
      message: "",
      timeStamp: "",
      messageId: "",
      chatId: "",
      isLiked: false,
      isRead: false);

  set setMessageModel(MessageModel copy) {
    _messageModel = copy;
    notifyListeners();
  }

  set setChatModel(ChatModel copy) {
    _chatModel = copy;
    notifyListeners();
  }

  MessageModel get messageModel => _messageModel;
  ChatModel get chatModel => _chatModel;

//fetch current user model and fill out sender field
  void submitMessage() async {
    if (!_formKey.currentState!.validate()) {
      print("could not submit");
      return;
    }
    _formKey.currentState?.save();
    final date = getCurrentDateFormat();
    setMessageModel =
        messageModel.copyWith(timeStamp: date, chatId: chatModel.chatId);
    _chatService.createNewMessage(messageModel);
    getMessageController.clear();
  }
}
