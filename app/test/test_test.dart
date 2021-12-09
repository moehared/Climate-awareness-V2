// import 'package:app/domain/models/user_model.dart';
// import 'package:app/domain/services/authentication_service/auth_service.dart';
// import 'package:app/domain/services/locator.dart';
// import 'package:app/dummy_test.dart/dummy_test.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/testing.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// class FirebaseAuthMock extends Mock implements FirebaseAuth {}

// class FirebaseUserMock extends Mock implements UserCredential {}

// @GenerateMocks([
//   http.Client,
// ])
// void main() {
//   UserModel user = UserModel(
//     userId: '22',
//     firstName: 'Anupras',
//     lastName: 'Test',
//     password: 'Tested123!',
//     email: 'tested@testing.com',
//     phoneNumber: '13067999999',
//     dateCreated: '11/04/2021',
//   );
//   // test('Counter value should be incremented', () {
//   //   final counter = Counter();
//   //   counter.increment();
//   //   expect(counter.value, 1);
//   // });

//   group('test user auth', () {
//     FirebaseAuthMock firebaseAuth = FirebaseAuthMock();
//     final FirebaseUserMock firebaseUser = FirebaseUserMock();

//     test('user logged in', () async {
//       // Use Mockito to return a successful response when it calls the
//       // provided http.Client.
//       when(firebaseAuth.signInWithEmailAndPassword(
//               email: user.email, password: user.password))
//           .thenAnswer((_) => Future<UserCredential>.value(firebaseUser));

//       expect(
//         await firebaseAuth.signInWithEmailAndPassword(
//           email: user.email,
//           password: user.password,
//         ),
//         firebaseUser,
//       );
//     });
//   });
// }
