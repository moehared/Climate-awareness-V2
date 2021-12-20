import 'package:app/domain/dialog_manager/dialog_model.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';

Future<DialogResponse> promptDialog(
    {required String message,
    String title = '',
    required final DiaglogService dialogService,
    bool showErrorAlert = false}) async {
  var requestDialog = await dialogService.showDialog(
    title: title,
    desc: message,
    isError: showErrorAlert,
  );
  print(requestDialog.confirmed);
  return requestDialog;
}
