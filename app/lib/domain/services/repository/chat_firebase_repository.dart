import 'package:app/common/config.dart';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseFireStoreRepo  implements RepositoryInterface<ChatModel> {
  ChatFirebaseFireStoreRepo();
  List<String> searchUserResults = [];

  @override
  Future<void> create(ChatModel chatModel) async {
    final doc = firestore.collection(CHAT_COLLECTION).doc();
    final docId = doc.id;
    chatModel = chatModel.copyWith(chatId: docId);
    final finalDoc = await doc.set(chatModel.toMap());
    return finalDoc;
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
     var something = firestore.collection(USER_COLLECTION)
     .where('firstName', isGreaterThanOrEqualTo: searchKey)
     .where("firstName", isLessThan: searchKey + 'z').snapshots();
      
    return something;
   }

   Future<List<UserModel>> getUserModelBySearchKeyByFirstName(String searchKey) async {
     QuerySnapshot querySnapshot = await firestore
     .collection(USER_COLLECTION)
     .where('firstName', isGreaterThanOrEqualTo: searchKey)
     .where("firstName", isLessThan: searchKey + 'z')
     .get();

     final userModels =  querySnapshot.docs
      .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
      
     return  await userModels;
   }



   void setSearchUserListResults(List<String> searchResults){
     this.searchUserResults = searchResults; 
   }

   List<String> getSearchUserListResults(){
     return this.searchUserResults;
   }



  

}