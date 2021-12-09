import 'dart:convert';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String password;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final double? c02Score;
  final String email;
  final String phoneNumber;
  final String dateCreated;
  final String dateUpdated;
  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.isPhoneVerified = false,
    this.isEmailVerified = false,
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
    bool? isEmailVerified,
    bool? isPhoneVerified,
    double? c02Score,
    String? email,
    String? phoneNumber,
    String? dateCreated,
    String? dateUpdated,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
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
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
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
      isEmailVerified: map['isEmailVerified'],
      isPhoneVerified: map['isPhoneVerified'],
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
    return 'UserModel(userId: $userId, firstName: $firstName, lastName: $lastName, password: $password, isEmailVerified: $isEmailVerified, c02Score: $c02Score, email: $email, phoneNumber: $phoneNumber, dateCreated: $dateCreated, dateUpdated: $dateUpdated,isPhoneVerified:$isPhoneVerified,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.password == password &&
        other.isEmailVerified == isEmailVerified &&
        other.c02Score == c02Score &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dateCreated == dateCreated &&
        other.isPhoneVerified == isPhoneVerified &&
        other.dateUpdated == dateUpdated;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        isEmailVerified.hashCode ^
        c02Score.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dateCreated.hashCode ^
        isPhoneVerified.hashCode ^
        dateUpdated.hashCode;
  }
}
