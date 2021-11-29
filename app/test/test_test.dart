import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/dummy_test.dart/dummy_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class FirebaseUserMock extends Mock implements UserCredential {}

@GenerateMocks([
  http.Client,
])
void main() {
  UserModel user = UserModel(
    userId: '22',
    firstName: 'Anupras',
    lastName: 'Test',
    password: 'Tested123!',
    email: 'tested@testing.com',
    phoneNumber: '13067999999',
    dateCreated: '11/04/2021',
  );
  ;
  // test('Counter value should be incremented', () {
  //   final counter = Counter();
  //   counter.increment();
  //   expect(counter.value, 1);
  // });

  group('test user auth', () {
    FirebaseAuthMock firebaseAuth = FirebaseAuthMock();
    final FirebaseUserMock firebaseUser = FirebaseUserMock();

    test('user logged in', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
  
      when(firebaseAuth.signInWithEmailAndPassword(
              email: user.email, password: user.password))
          .thenAnswer((_) => Future<UserCredential>.value(firebaseUser));

      expect(
        await firebaseAuth.signInWithEmailAndPassword(
          email: user.email,
          password: user.password,
        ),
        firebaseUser,
      );
    });
  });

  // mockito here
  // create a user, log it in, and return true if user is logged in

  // locator<AuthService>().signIn(user1);
  // expect(_loggedInUser(user1), true);

  // final user2 = UserModel(
  //   userId: '24',
  //   firstName: 'Anupra',
  //   lastName: 'Test',
  //   password: 'Tested123!',
  //   email: 'tested2@testing.com',
  //   phoneNumber: '13067999999',
  //   dateCreated: '11/04/2021',
  // );
  // locator<AuthService>().signIn(user2);
  // expect(_loggedInUser(user2), true);

  // final user3 = UserModel(
  //   userId: '25',
  //   firstName: 'Anuprass',
  //   lastName: 'Test',
  //   password: 'Tested123!',
  //   email: 'tested3@testing.com',
  //   phoneNumber: '13067999999',
  //   dateCreated: '11/04/2021',
  // );
  // locator<AuthService>().signIn(user3);
  // expect(_loggedInUser(user3), true);
  void setuserObj() {
    user = UserModel(
      userId: '22',
      firstName: 'Anupras',
      lastName: 'Test',
      password: 'Tested123!',
      email: 'tested@testing.com',
      phoneNumber: '13067999999',
      dateCreated: '11/04/2021',
    );
  }
  try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "barry.allen@example.com",
    password: "SuperSecretPassword!"
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "barry.allen@example.com",
    password: "SuperSecretPassword!"
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
User? user = FirebaseAuth.instance.currentUser;

if (user != null && !user.emailVerified) {
  var actionCodeSettings = ActionCodeSettings(
      url: 'https://www.example.com/?email=${user.email}',
      dynamicLinkDomain: 'example.page.link',
      androidPackageName: 'com.example.android',
      androidInstallApp: true,
      androidMinimumVersion: '12',
      iOSBundleId: 'com.example.ios',
      handleCodeInApp: true,
  );

  await user.sendEmailVerification(actionCodeSettings);
}
}
