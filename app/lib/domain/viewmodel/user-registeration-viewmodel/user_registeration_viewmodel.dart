import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/dialog_manager/prompt_dialog.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';
import 'package:app/ui/views/community-view/community_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserRegisterationViewModel extends BaseViewModel {
  AuthMode authMode = AuthMode.LOGIN;
  final _authService = locator<AuthService>();
  final _formKey = GlobalKey<FormState>();
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DiaglogService>();
  final _offsetX = -1.5;
  final _offsetY = 0.0;
  final _beginOpacity = 0.0;
  final _endOpacity = 1.0;
  var _showPassword = false;
  var _isValidPass = false;
  var _showConfirmedPassword = false;
  UserModel _userModel = UserModel(
    userId: "",
    firstName: "",
    lastName: "",
    password: "",
    isEmailVerified: false,
    c02Score: 0.00,
    email: "",
    phoneNumber: "",
    dateCreated: "",
    dateUpdated: "",
  );

  Animation<double>? _opacityAnim; // fade in animation
  Animation<Offset>? _slideAnimation;
  AnimationController? _controller;
  late final TextEditingController passwordController;

  /// initialize our animation objects
  void init(TickerProvider obj) {
    passwordController = TextEditingController();
    _controller = AnimationController(
      vsync: obj,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnim =
        Tween<double>(begin: _beginOpacity, end: _endOpacity).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
            begin: Offset(_offsetX, _offsetY), end: const Offset(0, 0))
        .animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  set setUserModelObj(UserModel copy) {
    _userModel = copy;
  }

  void toggleAuthMode() {
    if (authMode == AuthMode.LOGIN) {
      authMode = AuthMode.SIGNUP;
      _controller!.forward();
    } else {
      authMode = AuthMode.LOGIN;

      _controller!.reverse();
    }
    notifyListeners();
  }

  void togglePassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toggleConfirmedPassword() {
    _showConfirmedPassword = !_showConfirmedPassword;
    notifyListeners();
  }

  bool validPassWord() {
    print('valid password called...\n');
    return _isValidPass;
  }

  void disposeTextController() {
    passwordController.dispose();
  }

  set setSuccess(bool value) => _isValidPass = value;

  GlobalKey<FormState> get formkey => _formKey;

  Animation<double>? get opacityAnim => _opacityAnim;
  Animation<Offset>? get slideAnimation => _slideAnimation;
  AnimationController? get controller => _controller;
  UserModel get userModel => _userModel;
  bool get showPassword => _showPassword;
  bool get showConfirmedPassword => _showConfirmedPassword;

  void submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    setViewState(ViewState.BUSY);
    var isError = false;
    if (authMode == AuthMode.LOGIN) {
      print('signing in\n ');

      await _authService.signIn(userModel).onError((error, stackTrace) {
        isError = error as bool;
      });
      if (isError) {
        setViewState(ViewState.IDLE);
        isError = false;
        return;
      }
      if (!_authService.isUserEmailVerified()) {
        setViewState(ViewState.IDLE);
        print('sign in button tapped inside user == null ');
        promptDialog('an Email has been sent to you. Please check your email',
            'You are not verify yet', _dialogService);
      } else {
        _navService.navigateAndReplce(CommunityView.routeName);
      }
    } else if (authMode == AuthMode.SIGNUP) {
      print('signing up\n ');
      await _authService
          .signUp(userModel)
          .onError((error, stackTrace) => isError = error as bool);
      if (isError) {
        setViewState(ViewState.IDLE);
        isError = false;
        return;
      }
      _navService.navigateAndReplce(ConfirmEmailView.routeName);
    }
    setViewState(ViewState.IDLE);
  }
}
