import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final user = locator<UserRegisterationViewModel>();
  final accountService = locator<AccountDatabaseService>();
  Optional<UserCredential?> _userCredential = Optional.empty(null);

  AuthService(this._firebaseAuth);

  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  Optional<User?> get currentUser =>
      Optional.ofNullable(_firebaseAuth.currentUser);

  Future<void> _authenticate(
      {required UserModel userModel, bool isLogin = false}) async {
    try {
      if (isLogin) {
        _userCredential = (await _firebaseAuth.signInWithEmailAndPassword(
            email: userModel.email,
            password: userModel.password)) as Optional<UserCredential?>;
        print('display name: ${_userCredential.get()!.user!.displayName}\n');
      } else {
        _userCredential = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: userModel.email,
            password: userModel.password)) as Optional<UserCredential?>;
      }
      if (_userCredential.isPresent()) {
        user.setUserModelObj =
            user.userModel.copyWith(userId: _userCredential.get()!.user!.uid);
        _userCredential.get()!.user!.updateDisplayName(
              user.userModel.firstName + " " + user.userModel.lastName,
            );

        accountService.updateUser(user.userModel);
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
}
