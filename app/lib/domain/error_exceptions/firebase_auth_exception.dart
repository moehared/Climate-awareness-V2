import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements FirebaseAuthException {
  @override
  // TODO: implement code
  String get code => this.code;

  @override

  AuthCredential? get credential => this.credential;

  @override

  String? get email => this.email;

  @override
  String? get message => this.message;

  @override
  String? get phoneNumber => this.phoneNumber;

  @override

  String get plugin => throw UnimplementedError();

  @override

  StackTrace? get stackTrace => this.stackTrace;

  @override
  String? get tenantId => throw UnimplementedError();
}
