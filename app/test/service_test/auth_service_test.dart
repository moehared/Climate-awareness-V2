import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_data.dart';
import '../setup/test_helpers.dart';

@GenerateMocks([
  MockUserCredential,
  MockUser,
  MockFirebaseAuth,
])
void main() {
  final mockFirebaseAuth = MockFirebaseAuth();
  final mockUserCredential = MockUserCredential();
  final mockUser = MockUser();

  void setUpFirebaseAuthMock() {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: user.email, password: user.password))
        .thenAnswer((_) async {
      UserCredential inner() => mockUserCredential;
      return inner();
    });
    when(mockUserCredential.user).thenReturn(mockUser);
    when(mockUser.uid).thenReturn(user.userId);
  }

  group('Auth service tes', () {
    setUp(() async => registerServices());
    tearDown(() async => unregisterServices());

    test('sign in', () async {
      setUpFirebaseAuthMock();
      when(mockFirebaseAuth.currentUser).thenReturn(null);
      expect(AuthService(mockFirebaseAuth).signIn(user), mockUserCredential);
    });
    test('sign in failed', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: user.password))
          .thenAnswer((realInvocation) => Future.error('failed'));
      try {
        await AuthService(mockFirebaseAuth).signIn(user);
      } catch (e) {
        expect(e, 'failed');
      }
    });
  });
}
