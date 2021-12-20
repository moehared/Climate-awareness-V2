import 'dart:async';

import 'package:app/domain/dialog_manager/dialog_model.dart';

/// credit: from filled stack youtube tutorial.

class DiaglogService {
  Function(DialogRequest,bool)? _showDialogListener;
  Completer<DialogResponse>? _completer;
  void registerDialogListener(Function(DialogRequest,[bool isError]) showDiaglogLisener) {
    _showDialogListener = showDiaglogLisener;
  }

  Future<DialogResponse> showDialog({
    required String title,
    String desc = '',
    String buttonTitle = "Ok",
    String buttonCancel = '',
    bool isError = false
    
  }) {
    _completer = Completer();
    _showDialogListener!(DialogRequest(
      title: title,
      description: desc,
      buttonTitle: buttonTitle,
      cancelText: buttonCancel,
    ),isError);
    return _completer!.future;
  }

  void dialogComplete(DialogResponse response) {
    if (_completer != null) {
      _completer!.complete(response);
      _completer = null;
    }
  }
}
