import 'dart:convert';

import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/common/constant.dart';
import 'package:app/domain/models/questionaire-model/category.dart';
import 'package:app/domain/models/questionaire-model/questionaire.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/main.dart';

class SharePref {
  final _auth = locator<AuthService>();
  static void saveQuestionaire(String key, dynamic data) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (data is String) {
      pref.setString(key, data);
    } else if (data is UserModel) {
      pref.setString(key, data.toJson());
    } else {
      pref.setString(key, questionaireMap.toJson());
    }
  }

  static Future delete(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }

  static Future? getData(String key, [String uuid = '']) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    switch (key) {
      case QUESTIONAIRE_RESULT_BOX:
        final data = pref.get(key);
        if (data == null) return null;
        return json.decode(pref.getString(key) ?? '');
      case ProfileViewModel.USER_INFO:
        final data = pref.get(key);
        if (data == null) return null;
        return json.decode(pref.getString(key) ?? '');
      case ProfileViewModel.IMAGE_KEY:
        return pref.getString(uuid) ?? '';
      default:
        return '';
    }
  }
}
