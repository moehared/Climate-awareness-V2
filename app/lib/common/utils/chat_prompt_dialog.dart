import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../domain/services/dialog_service/chat_room_dialog_service.dart';

Future<DialogResponse> promptDialog(
    {String? message,
    String title = '',
    Widget? child,
    AlertType? alertType,
    required final ChatDialogService dialogService,
    bool showErrorAlert = false}) async {
  var requestDialog = await dialogService.showDialog(
    title: title,
    desc: message == null ? '' : message,
    isError: showErrorAlert,
    child: child,
    alertType: alertType,
  );
  print(requestDialog.confirmed);
  return requestDialog;
}
