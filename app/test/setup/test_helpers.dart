import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

final testLocator = GetIt.instance;

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

class MockAuthenticationService extends Mock implements AuthService {}

class MockNavigationService extends Mock implements NavigationService {}

class MockDialogService extends Mock implements DiaglogService {}

class MockAccountDatabaseService extends Mock
    implements AccountDatabaseService {}

AuthService getAndRegisterMockAuthenticationService() {
  _unregisterIfServiceExists<AuthService>();
  final service = MockAuthenticationService();
  testLocator.registerSingleton<AuthService>(service);
  return service;
}

NavigationService getAndRegisterMockNavigationService() {
  _unregisterIfServiceExists<NavigationService>();
  final service = MockNavigationService();
  testLocator.registerSingleton<NavigationService>(service);
  return service;
}

AccountDatabaseService getAndRegisterMockAccountDatabaseService() {
  _unregisterIfServiceExists<AccountDatabaseService>();
  final service = MockAccountDatabaseService();
  testLocator.registerSingleton<AccountDatabaseService>(service);
  return service;
}

DiaglogService getAndRegisterMockDialogService() {
  _unregisterIfServiceExists<DiaglogService>();
  final service = MockDialogService();
  testLocator.registerSingleton<DiaglogService>(service);
  return service;
}

/// note : must call the services you registered before using in the test
/// the services are register before the test runs
void registerServices() {
  getAndRegisterMockAccountDatabaseService();
  getAndRegisterMockAuthenticationService();
  getAndRegisterMockDialogService();
  getAndRegisterMockNavigationService();
}

/// must un-register services after done using it
/// must un-register for new services created
void unregisterServices() {
  testLocator.unregister<AuthService>();
  testLocator.unregister<NavigationService>();
  testLocator.unregister<DiaglogService>();
  testLocator.unregister<AccountDatabaseService>();
}

void _unregisterIfServiceExists<T extends Object>() {
  if (testLocator.isRegistered<T>()) {
    testLocator.unregister<T>();
  }
}
