import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserRegisterationViewModel extends BaseViewModel {
  AuthMode authMode = AuthMode.LOGIN;
  final _formKey = GlobalKey<FormState>();
  final _offsetX = -1.5;
  final _offsetY = 0.0;
  final _beginOpacity = 0.0;
  final _endOpacity = 1.0;
  var _showPassword = false;
  var _showConfirmedPassword = false;
  UserModel _userModel = UserModel(
    userId: "",
    firstName: "",
    lastName: "",
    password: "",
    isVerified: false,
    c02Score: 0.00,
    email: "",
    phoneNumber: "",
    dateCreated: "",
    dateUpdated: "",
  );

  Animation<double>? _opacityAnim; // fade in animation
  Animation<Offset>? _slideAnimation;
  AnimationController? _controller;

  /// initialize our animation objects
  void init(TickerProvider obj) {
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

  void setUserModelObj(UserModel copy) {
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

  GlobalKey<FormState> get formkey => _formKey;

  Animation<double>? get opacityAnim => _opacityAnim;
  Animation<Offset>? get slideAnimation => _slideAnimation;
  AnimationController? get controller => _controller;
  UserModel get userModel => _userModel;
  bool get showPassword => _showPassword;
  bool get showConfirmedPassword => _showConfirmedPassword;
}
