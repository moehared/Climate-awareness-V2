import 'dart:async';

import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:flutter/material.dart';

/// credit: from filled stack youtube tutorial.

class DiaglogService {
  Function(DialogRequest,bool,Widget?)? _showDialogListener;
  Completer<DialogResponse>? _completer;
  void registerDialogListener(Function(DialogRequest,[bool isError,Widget? child]) showDiaglogLisener) {
    _showDialogListener = showDiaglogLisener;
  }

  Future<DialogResponse> showDialog({
    required String title,
    String desc = '',
    String buttonTitle = "Ok",
    String buttonCancel = '',
    bool isError = false,
    Widget? child,
    
  }) {
    _completer = Completer();
    _showDialogListener!(DialogRequest(
      title: title,
      description: desc,
      buttonTitle: buttonTitle,
      cancelText: buttonCancel,
    ),isError,child);
    return _completer!.future;
  }

  void dialogComplete(DialogResponse response) {
    if (_completer != null) {
      _completer!.complete(response);
      _completer = null;
    }
  }
}
