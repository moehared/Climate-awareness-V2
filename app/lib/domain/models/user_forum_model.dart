import 'dart:convert';

class UserForumModel {
  final String forumId;
  final String userId;
  final String topic;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String imagePath;
  final String date;
  UserForumModel({
    required this.forumId,
    required this.userId,
    required this.topic,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.imagePath,
    required this.date,
  });

  UserForumModel copyWith({
    String? forumId,
    String? userId,
    String? topic,
    String? title,
    String? description,
    String? url,
    String? imageUrl,
    String? imagePath,
    String? date,
  }) {
    return UserForumModel(
      forumId: forumId ?? this.forumId,
      userId: userId ?? this.userId,
      topic: topic ?? this.topic,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'forumId': forumId,
      'userId': userId,
      'topic': topic,
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'date': date,
    };
  }

  factory UserForumModel.fromMap(Map<String, dynamic> map) {
    return UserForumModel(
      forumId: map['forumId'] ?? '',
      userId: map['userId'] ?? '',
      topic: map['topic'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      imagePath: map['imagePath'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserForumModel.fromJson(String source) => UserForumModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserForumModel(forumId: $forumId, userId: $userId, topic: $topic, title: $title, description: $description, url: $url, imageUrl: $imageUrl, imagePath: $imagePath, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserForumModel &&
      other.forumId == forumId &&
      other.userId == userId &&
      other.topic == topic &&
      other.title == title &&
      other.description == description &&
      other.url == url &&
      other.imageUrl == imageUrl &&
      other.imagePath == imagePath &&
      other.date == date;
  }

  @override
  int get hashCode {
    return forumId.hashCode ^
      userId.hashCode ^
      topic.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      imageUrl.hashCode ^
      imagePath.hashCode ^
      date.hashCode;
  }
}
