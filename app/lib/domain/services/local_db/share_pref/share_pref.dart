import 'dart:convert';

import 'package:app/common/constant.dart';
import 'package:app/domain/models/questionaire-model/category.dart';
import 'package:app/domain/models/questionaire-model/questionaire.dart';

import 'package:app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static void saveQuestionaire(String key, dynamic data) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print('saving data is : ${questionaireMap.toJson()}');
    pref.setString(key, questionaireMap.toJson());
  }

  static Future getData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    switch (key) {
      case QUESTIONAIRE_RESULT_BOX:
        print('fetched Data is :${pref.getString(key)}');
        return json.decode(pref.getString(key) ?? '');
      // return pref.getString(key) ?? '';

      default:
        return '';
    }
  }
}
