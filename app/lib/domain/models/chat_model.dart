import 'dart:convert';

import 'package:app/domain/models/user_model.dart';
import 'package:collection/collection.dart';

class ChatModel {
  final List arrayOfUserAndReciever; 
  final UserModel sender;
  final UserModel reciever;
  final String chatId;
  ChatModel({
    required this.arrayOfUserAndReciever,
    required this.sender,
    required this.reciever,
    required this.chatId,
  });
 

  ChatModel copyWith({
    List? arrayOfUserAndReciever,
    UserModel? sender,
    UserModel? reciever,
    String? chatId,
  }) {
    return ChatModel(
      arrayOfUserAndReciever: arrayOfUserAndReciever ?? this.arrayOfUserAndReciever,
      sender: sender ?? this.sender,
      reciever: reciever ?? this.reciever,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arrayOfUserAndReciever': arrayOfUserAndReciever,
      'sender': sender.toMap(),
      'reciever': reciever.toMap(),
      'chatId': chatId,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      arrayOfUserAndReciever: List.from(map['arrayOfUserAndReciever']),
      sender: UserModel.fromMap(map['sender']),
      reciever: UserModel.fromMap(map['reciever']),
      chatId: map['chatId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(arrayOfUserAndReciever: $arrayOfUserAndReciever, sender: $sender, reciever: $reciever, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is ChatModel &&
      listEquals(other.arrayOfUserAndReciever, arrayOfUserAndReciever) &&
      other.sender == sender &&
      other.reciever == reciever &&
      other.chatId == chatId;
  }

  @override
  int get hashCode {
    return arrayOfUserAndReciever.hashCode ^
      sender.hashCode ^
      reciever.hashCode ^
      chatId.hashCode;
  }
}
