import 'dart:async';

import 'package:app/common/utils/optional.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/error_exceptions/firebase_auth_exception.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // late final Stream<User?> _authState;
  final _dialogService = locator<DiaglogService>();
  User? _currentUser;
  final FirebaseAuth _firebaseAuth;
  final _accountService = locator<AccountDatabaseService>();
  Optional<UserCredential?> _userCredential = Optional.empty(null);

  AuthService(this._firebaseAuth) {
    // _authState = _firebaseAuth.authStateChanges();
    _currentUser = _firebaseAuth.currentUser;
  }

  // Stream<User?> get authState => _authState;
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
        _currentUser = _userCredential.get()?.user;
        updateUserEmailStatus();
        print('display name: ${_userCredential.get()!.user!.displayName}\n');
      } else {
        final String createdDateTime = DateTime.now().toIso8601String();
        final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password);
        _userCredential = Optional.of(newUser);
        _currentUser = _userCredential.get()?.user;
        if (_userCredential.isPresent()) {
          userModel = userModel.copyWith(
              userId: _userCredential.get()!.user!.uid,
              dateCreated: createdDateTime);
          _userCredential.get()!.user!.updateDisplayName(
                userModel.firstName + " " + userModel.lastName,
              );

          _accountService.createNewUser(userModel);
          await verifyUser(userModel);
        }
      }
    } on FirebaseAuthException catch (e) {
      print('catch error is ${e.toString()}');
      var errorMessage = 'Authentication failed.';
      if (e.message!.contains('The password is invalid')) {
        errorMessage = 'You have enter invalid password or email';
        print(errorMessage);
      } else if (e.message!.contains('already in use by another account.')) {
        errorMessage = 'email address is already in use.';
      } else if (e.message!.contains('operation not allowed')) {
        errorMessage = 'OPERATION_NOT_ALLOWED';
      } else if (e.message!.contains('many failed login attempts')) {
        errorMessage =
            'Access to this account has been temporarily disabled due to many failed login attempts\n. You can immediately restore it by resetting your password or you can try again later.';
      } else if (e.message!.contains('no user record')) {
        errorMessage = 'Email does not exist. Please Create new email address';
      } else if (e.message!.contains('account has been disabled')) {
        errorMessage = 'The user account has been disabled by an administrator';
      } else if (e.message!.contains('email doesnt exist')) {
        errorMessage = 'this email does not exist';
      }
      promptDialog(
        message: errorMessage,
        dialogService: locator<DiaglogService>(),
      );
      throw (true);
    } catch (e) {
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
    if (currentUser.isPresent()) {
      await currentUser.get()!.reload();
      if (!isUserEmailVerified()) {
        currentUser.get()!.sendEmailVerification();
      }
    }
  }

  Future<void> resetPassword({required String userEmailAddress}) async {
    var isError = false;
    _firebaseAuth
        .sendPasswordResetEmail(email: userEmailAddress)
        .catchError((e) {
      isError = true;

      return promptDialog(
        message:
            'An error occurred while reseting password. Please check your email and try again.',
        dialogService: _dialogService,
      );
    }).then((_) {
      // TODO: get the action code and confirm reset password and update user new password
      // see this: link: https://stackoverflow.com/questions/68832547/how-to-build-a-custom-email-action-handler-in-flutter-for-firebase-authenticatio
      if (!isError) {
        promptDialog(message: 'An email has been sent to you . Please check your email',dialogService: 
        _dialogService);
      }
    });
  }

  /// update user email to verified once
  void updateUserEmailStatus() async {
    await currentUser.get()!.reload();
    if (!isUserEmailVerified()) return;
    UserModel user =
        await _accountService.fetchUserModel(currentUser.get()!.uid).onError((e, s) {
      return Future.error(
        promptDialog(message: 'Data does not exist',dialogService:  _dialogService),
      );
    });
    if (isUserEmailVerified() && !user.isEmailVerified) {
      print('updated email');
      user = user.copyWith(isEmailVerified: true);
      _accountService.updateUser(user);
    }
  }

  /// return true if user is verified
  bool isUserEmailVerified() {
    return _userCredential.isPresent() &&
        _userCredential.get()!.user!.emailVerified;
  }

//TODO: verify user phone number then link their number with their account.
  bool _isUserPhoneVerified() {
    return currentUser.get()!.phoneNumber!.isNotEmpty;
  }
}
