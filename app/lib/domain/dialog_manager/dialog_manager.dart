import 'dart:io' show Platform;

import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DiaglogManager extends StatefulWidget {
  final Widget child;
  DiaglogManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _DiaglogManagerState createState() => _DiaglogManagerState();
}

class _DiaglogManagerState extends State<DiaglogManager> {
  final _dialogService = locator<DiaglogService>();

  @override
  void initState() {
    _dialogService.registerDialogListener(_showDialog);
    super.initState();
  }

  void _showDialog(DialogRequest dialogRequest,
      [bool showErrorAlert = false, Widget? child]) {
    if (showErrorAlert) {
      Alert(
        context: context,
        style: AlertStyle(
          animationType: AnimationType.grow,
          backgroundColor: Colors.white,
        ),
        desc: dialogRequest.title,
        type: AlertType.error,
        content: dialogRequest.description.isNotEmpty
            ? Text(dialogRequest.description)
            : Container(),
        buttons: [
          DialogButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              _dialogService.dialogComplete(DialogResponse(confirmed: true));
              Navigator.of(context).pop();
            },
            child: Text(
              dialogRequest.buttonTitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ).show();
    } else if (Platform.isIOS) {
      print("cupertino diaglog");

      showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(dialogRequest.title),
          content: child == null
              ? dialogRequest.description.isNotEmpty
                  ? Text(dialogRequest.description)
                  : null
              : child,
          actions: [
            if (dialogRequest.cancelText != null)
              CupertinoButton(
                onPressed: () {
                  _dialogService
                      .dialogComplete(DialogResponse(confirmed: false));
                },
                child: Text(dialogRequest.cancelText ?? "Cancel"),
              ),
            CupertinoButton(
              onPressed: () {
                _dialogService.dialogComplete(DialogResponse(confirmed: true));
                Navigator.of(context).pop();
              },
              child: Text(dialogRequest.buttonTitle),
            ),
          ],
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(dialogRequest.title),
              content: child == null
                  ? dialogRequest.description.isNotEmpty
                      ? Text(dialogRequest.description)
                      : null
                  : child,
              actions: [
                if (dialogRequest.cancelText != null)
                  TextButton(
                    onPressed: () {
                      _dialogService.dialogComplete(
                        DialogResponse(confirmed: false),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text(dialogRequest.cancelText ?? "Cancel"),
                  ),
                TextButton(
                  onPressed: () {
                    _dialogService.dialogComplete(
                      DialogResponse(confirmed: true),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text(dialogRequest.buttonTitle),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
