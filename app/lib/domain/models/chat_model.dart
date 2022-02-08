import 'dart:convert';

import 'package:app/domain/models/user_model.dart';

class ChatModel {
  final UserModel sender;
  final UserModel reciever;
  final String chatId;
  ChatModel({
    required this.sender,
    required this.reciever,
    required this.chatId,
  });


  ChatModel copyWith({
    UserModel? sender,
    UserModel? reciever,
    String? chatId,
  }) {
    return ChatModel(
      sender: sender ?? this.sender,
      reciever: reciever ?? this.reciever,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender.toMap(),
      'reciever': reciever.toMap(),
      'chatId': chatId,
    };

  }



  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      sender: UserModel.fromMap(map['sender']),
      reciever: UserModel.fromMap(map['reciever']),
      chatId: map['chatId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChatModel(sender: $sender, reciever: $reciever, chatId: $chatId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatModel &&
      other.sender == sender &&
      other.reciever == reciever &&
      other.chatId == chatId;
  }

  @override
  int get hashCode => sender.hashCode ^ reciever.hashCode ^ chatId.hashCode;
}
