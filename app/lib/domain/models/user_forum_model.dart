import 'dart:convert';

import 'package:collection/collection.dart';

class UserForumModel {
  final String forumId;
  final String userId;
  final String userDisplayName;
  final String topic;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String imagePath;
  dynamic likeCount;
  dynamic commentCount;
  Map<String, bool>? userLikePost;
  final String date;
  UserForumModel({
    required this.forumId,
    required this.userId,
    required this.userDisplayName,
    required this.topic,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.imagePath,
    required this.likeCount,
    required this.commentCount,
    this.userLikePost,
    required this.date,
  });
 

  UserForumModel copyWith({
    String? forumId,
    String? userId,
    String? userDisplayName,
    String? topic,
    String? title,
    String? description,
    String? url,
    String? imageUrl,
    String? imagePath,
    dynamic? likeCount,
    dynamic? commentCount,
    Map<String, bool>? userLikePost,
    String? date,
  }) {
    return UserForumModel(
      forumId: forumId ?? this.forumId,
      userId: userId ?? this.userId,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      topic: topic ?? this.topic,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      userLikePost: userLikePost ?? this.userLikePost,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'forumId': forumId,
      'userId': userId,
      'userDisplayName': userDisplayName,
      'topic': topic,
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'userLikePost': userLikePost,
      'date': date,
    };
  }

  factory UserForumModel.fromMap(Map<String, dynamic> map) {
    return UserForumModel(
      forumId: map['forumId'] ?? '',
      userId: map['userId'] ?? '',
      userDisplayName: map['userDisplayName'] ?? '',
      topic: map['topic'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      imagePath: map['imagePath'] ?? '',
      likeCount: map['likeCount'] ?? null,
      commentCount: map['commentCount'] ?? null,
      userLikePost: Map<String, bool>.from(map['userLikePost'] ?? {}),
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserForumModel.fromJson(String source) => UserForumModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserForumModel(forumId: $forumId, userId: $userId, userDisplayName: $userDisplayName, topic: $topic, title: $title, description: $description, url: $url, imageUrl: $imageUrl, imagePath: $imagePath, likeCount: $likeCount, commentCount: $commentCount, userLikePost: $userLikePost, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return other is UserForumModel &&
      other.forumId == forumId &&
      other.userId == userId &&
      other.userDisplayName == userDisplayName &&
      other.topic == topic &&
      other.title == title &&
      other.description == description &&
      other.url == url &&
      other.imageUrl == imageUrl &&
      other.imagePath == imagePath &&
      other.likeCount == likeCount &&
      other.commentCount == commentCount &&
      mapEquals(other.userLikePost, userLikePost) &&
      other.date == date;
  }

  @override
  int get hashCode {
    return forumId.hashCode ^
      userId.hashCode ^
      userDisplayName.hashCode ^
      topic.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      imageUrl.hashCode ^
      imagePath.hashCode ^
      likeCount.hashCode ^
      commentCount.hashCode ^
      userLikePost.hashCode ^
      date.hashCode;
  }
}
