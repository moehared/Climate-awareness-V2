import 'dart:convert';
import 'dart:io';

import 'package:app/common/constant.dart';
import 'package:app/domain/models/suggestion_place.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

const endpoint = 'https://apis.berkeley.edu/coolclimate/footprint-sandbox?';
const url =
    '$endpoint=3&input_location=Canada&input_income=6&input_size=3&input_footprint_transportation_miles1=0&input_footprint_transportation_mpg1=0&input_footprint_transportation_fuel1=0';

const placesEndPoint =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json?';

const defaultCarbonEndPoint =
    'https://apis.berkeley.edu/coolclimate/footprint-defaults';

const alternativeEndPoint = 
    'https://coolclimate.berkeley.edu/calculators/household-staging/api.php';

class NetworkService {
  final _dialogService = locator<DiaglogService>();
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

  Future<List<SuggestionPlace>> fetchPlaces(String city) async {
    final sessionToken = Uuid().v4();
    late final http.Response response;
    late final List<SuggestionPlace> places;
    final url =
        '$placesEndPoint&input=$city&types=(cities)&components=country:ca&key=$GOOGLE_API_KEY&sessiontoken=$sessionToken';
    final URL = Uri.parse(url);

    try {
      response = await http.get(URL);
      print('response is ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (decodedData['status'] as String == 'ZERO_RESULTS') {
          print('no city found');

          throw ('ZERO_RESULTS');
        }
        final list = decodedData['predictions'] as List<dynamic>;
        // print('list is $list');
        places = list.map<SuggestionPlace>((e) {
          // print('place_id ----> ${e['place_id']}\n name ----> ${e['description']} ');
          return SuggestionPlace(
            placeID: e['place_id'],
            name: e['description'],
          );
        }).toList();
      }
      return places;
    } catch (e) {
      throw (e);
    }
  }

  Future defaultCarbonFootPrintCalculator({
    required String city,
    required String income,
    required String size,
  }) async {
    late final http.Response response;
    final defaultURL =
        //'$defaultCarbonEndPoint?input_location_mode=2&input_location=$city&input_income=$income&input_size=$size';
        '$alternativeEndPoint?input_location_mode=1&input_location=$city&input_income=$income&input_size=$size&input_location_country=CA&op=get_defaults_and_results';

    try {
      final url = Uri.parse(defaultURL);
      response = await http.get(url, headers: {
        "accept": "application/xml",
        "app_id": API_ID,
        'app_key': API_KEY,
      });
      print('response is ${response.body}');
      // if (response.statusCode == 200) {

      // }
    } catch (e) {
      throw ('error occurred $e');
    }
  }
}
