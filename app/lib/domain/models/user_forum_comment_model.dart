import 'dart:convert';

class UserFourmCommentModel {
  final String forumId;
  final String commentId;
  final String userId;
  final String userComment;
  final String date; 
  UserFourmCommentModel({
    required this.forumId,
    required this.commentId,
    required this.userId,
    required this.userComment,
    required this.date,
  });

  UserFourmCommentModel copyWith({
    String? forumId,
    String? commentId,
    String? userId,
    String? userComment,
    String? date,
  }) {
    return UserFourmCommentModel(
      forumId: forumId ?? this.forumId,
      commentId: commentId ?? this.commentId,
      userId: userId ?? this.userId,
      userComment: userComment ?? this.userComment,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'forumId': forumId,
      'commentId': commentId,
      'userId': userId,
      'userComment': userComment,
      'date': date,
    };
  }

  factory UserFourmCommentModel.fromMap(Map<String, dynamic> map) {
    return UserFourmCommentModel(
      forumId: map['forumId'] ?? '',
      commentId: map['commentId'] ?? '',
      userId: map['userId'] ?? '',
      userComment: map['userComment'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFourmCommentModel.fromJson(String source) => UserFourmCommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserFourmCommentModel(forumId: $forumId, commentId: $commentId, userId: $userId, userComment: $userComment, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserFourmCommentModel &&
      other.forumId == forumId &&
      other.commentId == commentId &&
      other.userId == userId &&
      other.userComment == userComment &&
      other.date == date;
  }

  @override
  int get hashCode {
    return forumId.hashCode ^
      commentId.hashCode ^
      userId.hashCode ^
      userComment.hashCode ^
      date.hashCode;
  }
}
