import 'package:app/common/utils/input_validator.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';

class ForgetPassWordViewModel extends BaseViewModel {
  final _textEditController = TextEditingController();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DiaglogService>();
  TextEditingController get controller => _textEditController;

  resetPassword() async {
    if (_textEditController.text.isNotEmpty &&
        _textEditController.text.isValidEmail()) {
      await _authService.resetPassword(
        userEmailAddress: _textEditController.text,
      );
    }
  }
}
