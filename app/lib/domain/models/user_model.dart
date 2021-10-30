import 'dart:convert';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String password;
  final bool isVerified;
  final double c02Score;
  final String email;
  final String phoneNumber;
  final String dateCreated;
  final String dateUpdated;
  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.isVerified = false,
    this.c02Score = 0.0,
    required this.email,
    required this.phoneNumber,
    required this.dateCreated,
    this.dateUpdated = '',
  });
  // location object

  UserModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? password,
    bool? isVerified,
    double? c02Score,
    String? email,
    String? phoneNumber,
    String? dateCreated,
    String? dateUpdated,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      isVerified: isVerified ?? this.isVerified,
      c02Score: c02Score ?? this.c02Score,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateCreated: dateCreated ?? this.dateCreated,
      dateUpdated: dateUpdated ?? this.dateUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'isVerified': isVerified,
      'c02Score': c02Score,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateCreated': dateCreated,
      'dateUpdated': dateUpdated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      password: map['password'],
      isVerified: map['isVerified'],
      c02Score: map['c02Score'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dateCreated: map['dateCreated'],
      dateUpdated: map['dateUpdated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, lastName: $lastName, password: $password, isVerified: $isVerified, c02Score: $c02Score, email: $email, phoneNumber: $phoneNumber, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.password == password &&
        other.isVerified == isVerified &&
        other.c02Score == c02Score &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dateCreated == dateCreated &&
        other.dateUpdated == dateUpdated;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        isVerified.hashCode ^
        c02Score.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dateCreated.hashCode ^
        dateUpdated.hashCode;
  }
}
