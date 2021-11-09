import 'dart:convert';


class UserPostModel {
  final String userId;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String imagePath;
  final String type;
  final String user;
  final String category; 
 // final String updatedDate;
  String date;
  
  UserPostModel({
    this.user ="",
    required this.userId,
    required this.category,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.imagePath,
    required this.type,
    this.date ="",
  });

  UserPostModel _copyWith({
   String ? userId,
   String  ? title,
   String ? description,
   String ? url,
   String ? imageUrl,
   String ? imagePath,
   String ? type,
   String ? user,
   String ?category 
  })
  {
    return UserPostModel(
    userId: userId ?? this.userId, 
    category: category ?? this.category, 
    user: user ?? this.user,
    title: title ?? this.title,
    description: description ?? this.description,
    url: url ?? this.url, 
    imageUrl: imageUrl ?? this.imageUrl,
    imagePath: imagePath ?? this.imagePath,
    type: type ?? this.type );
  }

//Take saved values in local variable and return a map
    Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': user,
      'category': category,
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'type': type,
      'dateCreated': date,
    };
  }

// named constuctor: retrieve values and save it to local variables
  factory UserPostModel.fromMap(Map<String, dynamic> map){
    return UserPostModel(
      userId: map["userId"],
      user: map["username"],
      category: map["category"],
      title: map["title"],
      description: map["description"],
      url: map["url"],
      imageUrl: map["imageUrl"],
      imagePath: map["imagePath"],
      type: map["type"],
      date: map["dateCreated"],
    );
  }











}
