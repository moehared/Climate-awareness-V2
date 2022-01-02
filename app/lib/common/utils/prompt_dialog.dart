import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<DialogResponse> promptDialog(
    {String? message,
    String title = '',
    Widget? child,
    AlertType? alertType,
    required final DiaglogService dialogService,
    bool showErrorAlert = false}) async {
  var requestDialog = await dialogService.showDialog(
    title: title,
    desc: message == null ? '' : message,
    isError: showErrorAlert,
    child:child,
    alertType: alertType,
  );
  print(requestDialog.confirmed);
  return requestDialog;
}
