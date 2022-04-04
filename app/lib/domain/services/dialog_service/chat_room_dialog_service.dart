import 'dart:async';

import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

/// credit: from filled stack youtube tutorial.

class ChatDialogService {
  Function(DialogRequest, bool, Widget?, AlertType?)? _showDialogListener;
  Completer<DialogResponse>? _completer;
  void registerDialogListener(
      Function(DialogRequest, [bool isError, Widget? child, AlertType?])
          showDiaglogLisener) {
    _showDialogListener = showDiaglogLisener;
  }

  Future<DialogResponse> showDialog(
      {required String title,
      String desc = '',
      String buttonTitle = "Ok",
      String buttonCancel = 'Cancel',
      bool isError = false,
      Widget? child,
      AlertType? alertType}) {
    _completer = Completer();
    _showDialogListener!(
        DialogRequest(
          title: title,
          description: desc,
          buttonTitle: buttonTitle,
          cancelText: buttonCancel,
        ),
        isError,
        child,
        alertType);
    return _completer!.future;
  }

  void dialogComplete(DialogResponse response) {
    if (_completer != null) {
      _completer!.complete(response);
      _completer = null;
    }
  }
}
