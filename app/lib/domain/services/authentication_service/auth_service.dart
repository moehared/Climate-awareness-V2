import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final Stream<User?> _authState;
  late final User? _currentUser;
  final FirebaseAuth _firebaseAuth;
  final accountService = locator<AccountDatabaseService>();
  Optional<UserCredential?> _userCredential = Optional.empty(null);

  AuthService(this._firebaseAuth) {
    _authState = _firebaseAuth.authStateChanges();
    _currentUser = _firebaseAuth.currentUser;
  }

  Stream<User?> get authState => _authState;
  Optional<User?> get currentUser => Optional.ofNullable(_currentUser);

  Future<void> _authenticate(
      //TODO: validate user phone number . make sure user put correct format

      {required UserModel userModel,
      bool isLogin = false}) async {
    try {
      if (isLogin) {
        final _loggedInUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password,
        );
        _userCredential = Optional.of(_loggedInUser);
        print('display name: ${_userCredential.get()!.user!.displayName}\n');
      } else {
        final String createdDateTime = DateTime.now().toIso8601String();
        final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password);
        _userCredential = Optional.of(newUser);
        if (_userCredential.isPresent()) {
          userModel = userModel.copyWith(
              userId: _userCredential.get()!.user!.uid,
              dateCreated: createdDateTime);
          _userCredential.get()!.user!.updateDisplayName(
                userModel.firstName + " " + userModel.lastName,
              );
          accountService.createNewUser(userModel);
        }
      }
    } catch (e) {
      //TODO: create a custom class that handles error
      throw ("error occured while authenticating: $e");
    }
  }

  Future<void> signIn(UserModel userModel) async {
    return _authenticate(userModel: userModel, isLogin: true);
  }

  Future<void> signUp(UserModel userModel) async {
    return _authenticate(userModel: userModel);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> verifyUser(UserModel user) async {
    if (_isUserEmailVerified()) {
      user = user.copyWith(isVerified: true);
      accountService.updateUser(user);
      return;
    }
    if (currentUser.isPresent()) {
      await currentUser.get()!.reload();
      if (!_isUserEmailVerified()) {
        currentUser.get()!.sendEmailVerification();
      }
    }
  }

  bool _isUserEmailVerified() {
    return currentUser.get()!.emailVerified;
  }

//TODO: verify user phone number then link their number with their account.
  bool _isUserPhoneVerified() {
    return currentUser.get()!.phoneNumber!.isNotEmpty;
  }
}
