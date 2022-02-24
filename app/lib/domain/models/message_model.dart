import 'dart:convert';

import 'package:app/domain/models/user_model.dart';

class MessageModel {
 final  UserModel sender;
  String message;
  String timeStamp;
  String messageId;
  String chatId;
  final bool isLiked;
  final bool isRead;
  MessageModel({
    required this.sender,
    required this.message,
    required this.timeStamp,
    required this.messageId,
    required this.chatId,
    required this.isLiked,
    required this.isRead,
  });
 

  MessageModel copyWith({
    UserModel? sender,
    String? message,
    String? timeStamp,
    String? messageId,
    String? chatId,
    bool? isLiked,
    bool? isRead,
  }) {
    return MessageModel(
      sender: sender ?? this.sender,
      message: message ?? this.message,
      timeStamp: timeStamp ?? this.timeStamp,
      messageId: messageId ?? this.messageId,
      chatId: chatId ?? this.chatId,
      isLiked: isLiked ?? this.isLiked,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender.toMap(),
      'message': message,
      'timeStamp': timeStamp,
      'messageId': messageId,
      'chatId': chatId,
      'isLiked': isLiked,
      'isRead': isRead,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      sender: UserModel.fromMap(map['sender']),
      message: map['message'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      messageId: map['messageId'] ?? '',
      chatId: map['chatId'] ?? '',
      isLiked: map['isLiked'] ?? false,
      isRead: map['isRead'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(sender: $sender, message: $message, timeStamp: $timeStamp, messageId: $messageId, chatId: $chatId, isLiked: $isLiked, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageModel &&
      other.sender == sender &&
      other.message == message &&
      other.timeStamp == timeStamp &&
      other.messageId == messageId &&
      other.chatId == chatId &&
      other.isLiked == isLiked &&
      other.isRead == isRead;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
      message.hashCode ^
      timeStamp.hashCode ^
      messageId.hashCode ^
      chatId.hashCode ^
      isLiked.hashCode ^
      isRead.hashCode;
  }
}
