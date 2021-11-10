import 'package:app/dummy_test.dart/dummy_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  test('Counter value should be incremented', () {
   final counter = Counter();
  counter.increment();
   expect(counter.value, 1);
  });

  // mockito here
  // create a user, log it in, and return true if user is logged in
  // final user = UserModel(
  //   userId: '22',
  //   firstName: 'Anupras',
  //   lastName: 'Test',
  //   password: 'Tested123!',
  //   email: 'tested@testing.com',
  //   phoneNumber: '13067999999',
  //   dateCreated: '11/04/2021',
  // );
  // locator<AuthService>().signIn(user);
  // expect(_loggedInUser(user), true);

  // final user1 = UserModel(
  //   userId: '23',
  //   firstName: 'Anupr',
  //   lastName: 'Test',
  //   password: 'Tested123!',
  //   email: 'tested1@testing.com',
  //   phoneNumber: '13067999999',
  //   dateCreated: '11/04/2021',
  // );
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
}
