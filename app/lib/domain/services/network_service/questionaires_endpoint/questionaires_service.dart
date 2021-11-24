import 'dart:convert';

import 'package:app/common/constant.dart';
import 'package:app/domain/services/locator.dart';
import 'package:http/http.dart' as http;

const endpoint = 'https://apis.berkeley.edu/coolclimate/footprint-sandbox?';
const url =
    '$endpoint=3&input_location=Canada&input_income=6&input_size=3&input_footprint_transportation_miles1=0&input_footprint_transportation_mpg1=0&input_footprint_transportation_fuel1=0';

class QuestionairesService {
  Future getCarbonApi() async {
    late final http.Response response;
    try {
      Uri uri = Uri.parse(url);
      response = await http.get(uri, headers: {
        "accept": "application/xml",
        "app_id": API_ID,
        'app_key': API_KEY,
      });
      if (response.statusCode > 400) {
        print('status code == ${response.statusCode}');
        return;
      }
      if (response.statusCode == 200) {
        xml2Json.parse(response.body);
        final responseBody = xml2Json.toParker();
        final decodedData = json.decode(responseBody);
        print(decodedData);
      }
      print('status code is equal ${response.statusCode}');
    } catch (e) {
      throw ('could not load questionaire endpoint $e');
    }
  }
}
