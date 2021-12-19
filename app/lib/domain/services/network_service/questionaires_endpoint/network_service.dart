import 'dart:convert';
import 'dart:io';

import 'package:app/common/config.dart';
import 'package:app/domain/models/place-model/place.dart';
import 'package:app/domain/models/place-model/suggestion_place.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

const endpoint = 'https://apis.berkeley.edu/coolclimate/footprint-sandbox?';
const url =
    '$endpoint=3&input_location=Canada&input_income=6&input_size=3&input_footprint_transportation_miles1=0&input_footprint_transportation_mpg1=0&input_footprint_transportation_fuel1=0';

const placesEndPoint =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json?';

const PLACE_DETAILS_ENDPOINT =
    'https://maps.googleapis.com/maps/api/place/details/json';

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

  Future<double> defaultCarbonFootPrintCalculatorByPostalCode({
    required String postalCode,
    required String income,
    required String size,
  }) async {
    final trimmedPostalCode = postalCode.replaceAll(RegExp(r' '), '');
    print('trimmedPostalCode = $trimmedPostalCode');
    late final http.Response response;
    final defaultURL =
        //'$defaultCarbonEndPoint?input_location_mode=2&input_location=$city&input_income=$income&input_size=$size';
        '$alternativeEndPoint?input_location_mode=1&input_location=$trimmedPostalCode&input_income=$income&input_size=$size&input_location_country=CA&op=get_defaults_and_results';

    try {
      final url = Uri.parse(defaultURL);
      response = await http.get(url, headers: {
        "accept": "application/xml",
        "app_id": API_ID,
        'app_key': API_KEY,
      });

      if (response.statusCode >= 400) {
        return throw ('error occured. state code is ${response.statusCode}');
      }

      xml2Json.parse(response.body);
      final responseBody = xml2Json.toParker();
      final decodedData = json.decode(responseBody);
      final String result = decodedData['response']['result_grand_total'];

      // print('grand total is :$result\n runType is =  ${result.runtimeType}');
      return double.parse(result) / 12.0;
    } catch (e) {
      throw ('error occurred $e');
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

  Future<void> getPlaceDetails(String placeID) async {
    late final http.Response response;
    var place = Place(city: '', street: '', streetNumber: '', zipCode: '');
    final sessionToken = Uuid().v4();
    //fields=address_component&
    final urlEndPoint =
        // 'https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyANoPTW9_6_FU5BW_KhkHENGP1XMxLzx1c&place_id=$placeID';
        '$PLACE_DETAILS_ENDPOINT?place_id=$placeID&key=$GOOGLE_API_KEY&sessiontoken=$sessionToken';

    try {
      final url = Uri.parse(urlEndPoint);
      response = await http.get(url);
      final result = json.decode(response.body);
      print('decoded data: $result');
      print('place detail geometry: ${result['result']['geometry']}');

      final components =
          result['result']['address_components'] as List<dynamic>;
      //TODO: decode the geomtry location and see if zip code is found.
      final geometry = result['result']['geometry'];

      // build result

      components.forEach((c) {
        final List type = c['types'];
        if (type.contains('street_number')) {
          place = place.copyWith(streetNumber: c['long_name']);
        }
        if (type.contains('route')) {
          place = place.copyWith(street: c['long_name']);
        }
        if (type.contains('locality')) {
          place = place.copyWith(city: c['long_name']);
        }
        if (type.contains('postal_code')) {
          place = place.copyWith(zipCode: c['long_name']);
        }
      });
      debugPrint('place details: ${place.toString()}');
      // return Place(streetNumber: streetNumber, street: street, city: city, zipCode: zipCode);
    } catch (e) {
      throw ('could not fetch place details: $e');
    }
  }
}
