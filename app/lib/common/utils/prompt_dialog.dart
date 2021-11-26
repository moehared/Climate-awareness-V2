import 'package:app/domain/services/dialog_service/dialog_service.dart';

Future promptDialog(
    String message, String title, final DiaglogService dialogService) async {
  var requestDialog =
      await dialogService.showDialog(title: title, desc: message);
  print(requestDialog.confirmed);
  return;
}
