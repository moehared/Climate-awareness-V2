import 'dart:math';

import 'package:app/common/config.dart';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../ui/views/chat-view/message-view.dart';

class ChatFirebaseFireStoreRepo implements RepositoryInterface<ChatModel> {
  ChatFirebaseFireStoreRepo();
  List<UserModel> searchUserResults = [];
  String ARRAY_OF_USER_AND_RECIEVER_KEY = "arrayOfUserAndReciever";

  Future<bool> checkIfUserAlreadyHasChatRoom(String recieverId) async {
    bool checkIfUserChatExists = false;
    var collectionIfExists = await firestore
        .collection("userChat")
        .get();
    var currentUserId = locator<AuthService>().currentUser.get()!.uid;
    for (var d in collectionIfExists.docs) {
      List value = d.data()[ARRAY_OF_USER_AND_RECIEVER_KEY];
      //print( "data line 32 ${d.data()[ARRAY_OF_USER_AND_RECIEVER_KEY]}");
            if(value.isNotEmpty){
                //print("inside if state ");
                if((value[0] == recieverId || value[0] == currentUserId) && (value[1] == recieverId || value[1] == currentUserId)){
                  checkIfUserChatExists = true;
                }
            }
    }
    return checkIfUserChatExists;
  }

  Future<String> getChatModelFromCurrentUserAndRecieverId(String currentUId, String recieverId) async{
    var chatModel = await firestore.collection("userChat").get();
    var specificChatId = "";
    for (var d in chatModel.docs) {
      List value = d.data()[ARRAY_OF_USER_AND_RECIEVER_KEY];
      //print( "data line 32 ${d.data()[ARRAY_OF_USER_AND_RECIEVER_KEY]}");
      print("${d.data()["chatId"]}");
      if (value.isNotEmpty) {
        //print("inside if state ");
        if ((value[0] == recieverId || value[0] == currentUId) &&
            (value[1] == recieverId || value[1] == currentUId)) {
            specificChatId = d.data()["chatId"];
        }
      }
    }
    return specificChatId;

   
  }

  @override
  Future<String> create(ChatModel chatModel) async {
    final doc = firestore.collection(CHAT_COLLECTION).doc();
    final docId = doc.id;
    chatModel = chatModel.copyWith(chatId: docId);
    await doc.set(chatModel.toMap());
    return doc.id;
  }

  @override
  Future<ChatModel> read(String chatId) async {
    final doc = await firestore.collection(CHAT_COLLECTION).doc(chatId).get();
    final data = Optional.ofNullable(doc.data());
    if (data.isPresent()) {
      return ChatModel.fromMap(data.get()!);
    }
    return Future.error('Data does not exist');
  }

  @override
  Future<void> update(ChatModel chatModel) async {
    print('post data map: ${chatModel.toMap()}');
    await firestore
        .collection(CHAT_COLLECTION)
        .doc(chatModel.chatId)
        .set(chatModel.toMap());
    // TODO: implement update
    //throw UnimplementedError();
  }

  @override
  Future<void> delete(String chatId) async {
    await firestore.collection(CHAT_COLLECTION).doc(chatId).delete();
    // TODO: implement delete
    //throw UnimplementedError();
  }

  Stream getListOfUsers(String searchKey) {
    var something = firestore
        .collection(USER_COLLECTION)
        .where('firstName', isGreaterThanOrEqualTo: searchKey)
        .where("firstName", isLessThan: searchKey + 'z')
        .snapshots();

    return something;
  }

  Future<List<UserModel>> getUserModelBySearchKeyByFirstName(
      String searchKey) async {
    QuerySnapshot querySnapshot = await firestore
        .collection(USER_COLLECTION)
        .where('firstName', isGreaterThanOrEqualTo: searchKey)
        .where("firstName", isLessThan: searchKey + 'z')
        .get();

    final userModels = querySnapshot.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    return await userModels;
  }

  Future<List<ChatModel>> getChatModels(String currentUserId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("userChat")
        .where("userId", isEqualTo: currentUserId)
        .get();

    final chatModels = querySnapshot.docs
        .map((doc) => ChatModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return await chatModels;
  }

  void setSearchUserListResults(List<UserModel> searchResults) {
    this.searchUserResults = searchResults;
  }

  List<UserModel> getSearchUserListResults() {
    return this.searchUserResults;
  }

  //  UserModel fetchReciverOrSender(String chatID ){
  //    if()
  //  }

  void createNewMessage(MessageModel messageModel) async {
    print("Do i get to this part 98");
    final docRef = firestore.collection("messages").doc(messageModel.chatId);
    print("got to line 101 chat repo");
    final userMessages = docRef.collection("userMessages").doc();
    final userMessagesId = userMessages.id;
    messageModel = messageModel.copyWith(messageId: userMessagesId);
    userMessages.set(messageModel.toMap());
    print(" message sent this is from chat repo");
  }

  Future<List<MessageModel>> getMessages(String chatId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("messages")
        .doc(chatId)
        .collection("userMessages")
        //.where("userID",isEqualTo: userId)
        .orderBy("timeStamp", descending: false)
        .limit(1)
        .get();

    final messageModels = querySnapshot.docs
        .map((doc) => MessageModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return await messageModels;
  }

  Future<String> getUserNameFromChatModel(String chatId) async {
    ChatModel chatModel = await read(chatId);
    if (locator<AuthService>().currentUser.get()!.uid ==
        chatModel.reciever.userId) {
      return "${chatModel.reciever.firstName} ${chatModel.reciever.lastName}";
    } else {
      return "${chatModel.reciever.firstName} ${chatModel.reciever.lastName}";
    }
  }

  Future<MessageModel> getRecentChatMessage(String chatId) async {
    final doc = await firestore
        .collection("messages")
        .doc(chatId)
        .collection("userMessages")
        .orderBy("timeStamp", descending: true)
        .limit(1)
        .get();

    for (var d in doc.docs) {
      print('print data ${d.data()}');
      debugPrint('doc data for chat id $chatId');
      final data = Optional.ofNullable(d.data());
      debugPrint('data is ${d.data()}');
      if (data.isPresent()) {
        return MessageModel.fromMap(data.get());
      }
    }

    return Future.error('Data does not exist');
  }
}
