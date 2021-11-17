import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/dummy_test.dart/dummy_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  final _authClient = locator<AuthService>();
  UserModel? user;
  // test('Counter value should be incremented', () {
  //   final counter = Counter();
  //   counter.increment();
  //   expect(counter.value, 1);
  // });

  group('test user auth', () {
    test('returns an Album if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(_authClient.signIn(user!));
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
  void setup() {
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
}
