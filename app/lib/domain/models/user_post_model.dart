import 'dart:convert';

class UserPostModel {
  final String postId;
  final String userId;
  final String description;
  final String url;
  final String imageUrl;
  final String imagePath;
  final String type;
  final String category; 
  final String date;
  UserPostModel({
    required this.postId,
    required this.userId,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.imagePath,
    required this.type,
    required this.category,
    required this.date,
  });


  UserPostModel copyWith({
    String? postId,
    String? userId,
    String? description,
    String? url,
    String? imageUrl,
    String? imagePath,
    String? type,
    String? category,
    String? date,
  }) {
    return UserPostModel(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      type: type ?? this.type,
      category: category ?? this.category,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'type': type,
      'category': category,
      'date': date,
    };
  }

  factory UserPostModel.fromMap(Map<String, dynamic> map) {
    return UserPostModel(
      postId: map['postId'] ?? '',
      userId: map['userId'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      imagePath: map['imagePath'] ?? '',
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPostModel.fromJson(String source) => UserPostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserPostModel(postId: $postId, userId: $userId, description: $description, url: $url, imageUrl: $imageUrl, imagePath: $imagePath, type: $type, category: $category, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserPostModel &&
      other.postId == postId &&
      other.userId == userId &&
      other.description == description &&
      other.url == url &&
      other.imageUrl == imageUrl &&
      other.imagePath == imagePath &&
      other.type == type &&
      other.category == category &&
      other.date == date;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
      userId.hashCode ^
      description.hashCode ^
      url.hashCode ^
      imageUrl.hashCode ^
      imagePath.hashCode ^
      type.hashCode ^
      category.hashCode ^
      date.hashCode;
  }
}
