import 'dart:convert';
import 'dart:ffi';

import 'package:app/common/config.dart';
import 'package:app/common/constant.dart';
import 'package:app/domain/models/place-model/place.dart';
import 'package:app/domain/models/place-model/suggestion_place.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';
import 'package:app/domain/models/questionaire-model/questionaire-result.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/local_db/share_pref/share_pref.dart';

import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/quick-carbon-viewmodel/quick-carbon-viewmodel.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

// const GEOAPIFYENDPOINT = 'https://api.geoapify.com/v1/geocode/autocomplete?text=Mosco&apiKey';
const NOMINATIM_OPENSTREETMAP_API =
    'https://nominatim.openstreetmap.org/search.php?q=';
const refinedEndpoint = 'https://apis.berkeley.edu/coolclimate/footprint?';
const url =
    '$refinedEndpoint=3&input_location=Canada&input_income=6&input_size=3&input_footprint_transportation_miles1=0&input_footprint_transportation_mpg1=0&input_footprint_transportation_fuel1=0';

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

  // final _questionaireBox = locator<Boxes<QuestionaireResult>>();
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

  // Future<List<SuggestionPlace>> fetchPlaces(String city) async {
  //   final sessionToken = Uuid().v4();
  //   late final http.Response response;
  //   late final List<SuggestionPlace> places;
  //   // final url =
  //   //     '$placesEndPoint&input=$city&types=(cities)&components=country:ca&key=$GOOGLE_API_KEY&sessiontoken=$sessionToken';

  //   final openStreetApi =
  //       '$NOMINATIM_OPENSTREETMAP_API$city&format=jsonv2';
  //   print('open map= $openStreetApi');
  //   final URL = Uri.parse(openStreetApi);

  //   try {
  //     response = await http.get(URL);
  //     print('response is ${response.body}');

  //     if (response.statusCode == 200) {
  //       final decodedData = json.decode(response.body);
  //       if (decodedData['status'] as String == 'ZERO_RESULTS') {
  //         print('no city found');

  //         throw ('ZERO_RESULTS');
  //       }
  //       final list = decodedData['predictions'] as List<dynamic>;
  //       // print('list is $list');
  //       places = list.map<SuggestionPlace>((e) {
  //         // print('place_id ----> ${e['place_id']}\n name ----> ${e['description']} ');
  //         return SuggestionPlace(
  //           placeID: e['place_id'],
  //           name: e['description'],
  //         );
  //       }).toList();
  //     }
  //     return places;
  //   } catch (e) {
  //     throw (e);
  //   }
  // }

  Future<List<SuggestionPlace>> fetchPlaces(String city) async {
    late final http.Response response;
    List<SuggestionPlace> places = [];
    final openStreetApi = '$NOMINATIM_OPENSTREETMAP_API$city&format=jsonv2';
    print('open map= $openStreetApi');
    final URL = Uri.parse(openStreetApi);

    try {
      response = await http.get(URL);
      // print('response is ${response.body}');
      // print('\n');
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body) as List<dynamic>;
        debugPrint('decodedData is $decodedData');
        places = decodedData.asMap().keys.map((index) {
          return SuggestionPlace(
              placeID: decodedData[index]['place_id'],
              name: decodedData[index]['display_name'],
              lat: decodedData[index]['lat'],
              lon: decodedData[index]['lon'],
              osmId: decodedData[index]['osm_id']);
        }).toList();
      }
      return places;
    } catch (e) {
      throw ('Could not find suggestion place $e');
    }
  }

  Future<void> defaultCarbonFootPrintCalculatorByPostalCode({
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
        throw ('error occured. state code is ${response.statusCode}');
      }

      xml2Json.parse(response.body);
      final responseBody = xml2Json.toParker();
      final decodedData = json.decode(responseBody) as Map<String, dynamic>;
      print('DECODED DEFAULT DATA: $decodedData');
      final String result = decodedData['response']['result_grand_total'];
      debugPrint('result == $result');

      final double electricityVal = double.tryParse(
              '${decodedData['response']['result_electricity_direct']}') ??
          0;
      final double naturalVal = double.tryParse(
              '${decodedData['response']['result_natgas_direct']}') ??
          0;

      final double shelter =
          double.tryParse('${decodedData['response']['result_shelter']}') ?? 0;
      final double heatingVal = double.tryParse(
              '${decodedData['response']['result_heatingoil_direct']}') ??
          0;
      final energy = electricityVal + naturalVal + shelter + heatingVal;
      print('energy == $energy');
      final String grandTotal = decodedData['response']['result_grand_total'];
      final String airTravel =
          decodedData['response']['result_air_travel_direct'];
      final String vehicle =
          decodedData['response']['result_motor_vehicles_direct'];
      final String transit =
          decodedData['response']['result_publictrans_direct'];
      final String service = decodedData['response']['result_services_total'];
      final String food = decodedData['response']['result_food_total'];
      final String waterUsage = decodedData['response']['result_watersewage'];
      print('map values: ${questionaireMap.categoryMap}');
      print('questionaire obj: ${questionaireMap.toString()}');
      questionaireMap.result = questionaireMap.result.copyWith(
        resultGrandTotal: double.tryParse(grandTotal)! / 12.0,
        resultAirTravelDirect: double.tryParse(airTravel),
        resultMotorVehiclesDirect: double.tryParse(vehicle),
        resultPublictransDirect: double.tryParse(transit),
        energy: energy,
        id: 'id',
        // category: questionaireMap.categoryMap,
        resultServicesTotal: double.tryParse(service),
        resultFoodTotal: double.tryParse(food),
        resultWaterSewage: double.tryParse(waterUsage),
      );

      try {
        // save data on location device;
        SharePref.saveQuestionaire(QUESTIONAIRE_RESULT_BOX, questionaireMap);
        // _questionaireBox.getQuestionaireResultBox
        //     .put(questionaireMap.result.id, questionaireMap.result);
      } catch (e) {
        throw ('Could not persist data in local storage');
      }
      // print('grand total is :$result\n runType is =  ${result.runtimeType}');
      // return double.parse(result) / 12.0;
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



  // Future<SelectedCity> getPlaceDetails(String placeID) async {
  //   late final http.Response response;
  //   var place = SelectedCity(city: '', zipCode: '', country: '');
  //   final sessionToken = Uuid().v4();
  //   //fields=address_component&
  //   final urlEndPoint =
  //       // 'https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyANoPTW9_6_FU5BW_KhkHENGP1XMxLzx1c&place_id=$placeID';
  //       '$PLACE_DETAILS_ENDPOINT?place_id=$placeID&key=$GOOGLE_API_KEY&sessiontoken=$sessionToken';

  //   try {
  //     final url = Uri.parse(urlEndPoint);
  //     response = await http.get(url);
  //     final result = json.decode(response.body);
  //     // debugPrint('decoded data: $result');
  //     // debugPrint('place detail geometry: ${result['result']['geometry']}');

  //     final geometry = result['result']['geometry'];
  //     final lat = geometry['location']['lat'];
  //     final lng = geometry['location']['lng'];

  //     // debugPrint('lat == $lat');
  //     // debugPrint('lng == $lng');

  //     final placeMark = await placemarkFromCoordinates(lat, lng);
  //     place = place.copyWith(zipCode: placeMark[0].postalCode);
  //     place = place.copyWith(city: placeMark[0].locality);
  //     place = place.copyWith(country: placeMark[0].country);

  //     debugPrint('place details: ${place.toString()}');
  //     return place;
  //   } catch (e) {
  //     throw ('could not fetch place details: $e');
  //   }
  // }

  Future getRefinedCarbonFootprint() async {
    var utilitiesUrlParam = '';
    var naturalUrlParam = '';
    var heatingUrlParam = '';
    var transportationUrlParam = '';
    var foodUrlParam = '';
    var goodsServicesUrlParam = '';
    questionaireMap.categoryMap.values.toList().forEach((category) {
      if (category is Utilities) {
        print('utilities object ${category.toString()}');
        utilitiesUrlParam =
            '&input_footprint_housing_electricity_type=${category.electricityType}' +
                '&input_footprint_housing_electricity_dollars=${category.dollarPerElectricty}' +
                '&input_footprint_housing_electricity_kwh=${category.kwhPerElectricity}' +
                '&input_footprint_housing_cleanpercent=0&input_footprint_housing_cdd=0' +
                '&input_footprint_housing_hdd=0' +
                '&input_footprint_housing_gco2_per_kwh=590' +
                '&input_footprint_housing_watersewage=${category.waterUsage}' +
                '&input_footprint_housing_squarefeet=${category.livingSpaceArea}';
        naturalUrlParam =
            '&input_footprint_housing_naturalgas_dollars=${category.dollarPerYearNaturalGas}' +
                '&input_footprint_housing_naturalgas_type=${category.naturalGasType}' +
                '&input_footprint_housing_naturalgas_therms=${category.thermsPerYearNaturalGas}' +
                '&input_footprint_housing_naturalgas_cuft=${category.livingSpaceArea}';
        heatingUrlParam =
            '&input_footprint_housing_heatingoil_type=${category.heatingOilType}' +
                '&input_footprint_housing_heatingoil_dollars=${category.dollarHeatingOil}' +
                '&input_footprint_housing_heatingoil_gallons=${category.heatingOilType}' +
                '&input_footprint_housing_heatingoil_dollars_per_gallon=${category.dollarGallonHeatingOil}';
      } else if (category is Transportation) {
        print('\n');
        print('transportation object ${category.toString()}');
        transportationUrlParam = '&input_footprint_transportation_groundtype=${category.isSimple}' +
            '&input_footprint_transportation_publictrans=${category.totalPublicTransitPerYear}' +
            '&input_footprint_transportation_bus=${category.bus}' +
            '&internal_state_abbreviation=CA' +
            '&input_footprint_transportation_transit=${category.transitRail}' +
            '&input_footprint_transportation_commuter=${category.commuterRail}' +
            '&input_footprint_transportation_intercity=${category.interCityRail}' +
            '&input_footprint_transportation_airtype=${category.isSimple}' +
            '&input_footprint_transportation_airtotal=${category.totalAirTravelPerYear}' +
            '&input_footprint_transportation_airshort=${category.numberOfShortTravelByAir}' +
            '&input_footprint_transportation_airmedium=${category.numberOfMediumTravelByAir}' +
            '&input_footprint_transportation_airlong=${category.numberOfLongTravelByAir}' +
            '&input_footprint_transportation_airextended=${category.numberOfExtendedTravelByAir}' +
            '&input_footprint_transportation_num_vehicles=${category.numberOfVehicle}';
        print('vehicle len == ${category.vehicle.length}');
        switch (category.vehicle.length) {
          case 0:
            transportationUrlParam = transportationUrlParam +
                '&input_footprint_transportation_miles1=0' +
                '&input_footprint_transportation_mpg1=0' +
                '&input_footprint_transportation_fuel1=0' +
                '&input_footprint_transportation_miles2=0' +
                '&input_footprint_transportation_mpg2=0' +
                '&input_footprint_transportation_fuel2=0' +
                '&input_footprint_transportation_miles3=0' +
                '&input_footprint_transportation_mpg3=0' +
                '&input_footprint_transportation_fuel3=0' +
                '&input_footprint_transportation_miles4=0' +
                '&input_footprint_transportation_mpg4=0' +
                '&input_footprint_transportation_fuel4=0' +
                '&input_footprint_transportation_miles5=0' +
                '&input_footprint_transportation_mpg5=0' +
                '&input_footprint_transportation_fuel5=0' +
                '&input_footprint_transportation_miles6=0' +
                '&input_footprint_transportation_mpg6=0' +
                '&input_footprint_transportation_fuel6=0' +
                '&input_footprint_transportation_miles7=0' +
                '&input_footprint_transportation_mpg7=0' +
                '&input_footprint_transportation_fuel7=0' +
                '&input_footprint_transportation_miles8=0' +
                '&input_footprint_transportation_mpg8=0' +
                '&input_footprint_transportation_fuel8=0' +
                '&input_footprint_transportation_miles9=0' +
                '&input_footprint_transportation_mpg9=0' +
                '&input_footprint_transportation_fuel9=0' +
                '&input_footprint_transportation_miles10=0' +
                '&input_footprint_transportation_mpg10=0' +
                '&input_footprint_transportation_fuel10=0';

            break;
          case 1:
            print('case 1: executed');
            transportationUrlParam = transportationUrlParam +
                '&input_footprint_transportation_miles1=${category.vehicle[0]?.totalDrivenPerYear}' +
                '&input_footprint_transportation_mpg1=${category.vehicle[0]?.mpgValue}' +
                '&input_footprint_transportation_fuel1=${category.vehicle[0]?.fuelType}' +
                '&input_footprint_transportation_miles2=0' +
                '&input_footprint_transportation_mpg2=0' +
                '&input_footprint_transportation_fuel2=0' +
                '&input_footprint_transportation_miles3=0' +
                '&input_footprint_transportation_mpg3=0' +
                '&input_footprint_transportation_fuel3=0' +
                '&input_footprint_transportation_miles4=0' +
                '&input_footprint_transportation_mpg4=0' +
                '&input_footprint_transportation_fuel4=0' +
                '&input_footprint_transportation_miles5=0' +
                '&input_footprint_transportation_mpg5=0' +
                '&input_footprint_transportation_fuel5=0' +
                '&input_footprint_transportation_miles6=0' +
                '&input_footprint_transportation_mpg6=0' +
                '&input_footprint_transportation_fuel6=0' +
                '&input_footprint_transportation_miles7=0' +
                '&input_footprint_transportation_mpg7=0' +
                '&input_footprint_transportation_fuel7=0' +
                '&input_footprint_transportation_miles8=0' +
                '&input_footprint_transportation_mpg8=0' +
                '&input_footprint_transportation_fuel8=0' +
                '&input_footprint_transportation_miles9=0' +
                '&input_footprint_transportation_mpg9=0' +
                '&input_footprint_transportation_fuel9=0' +
                '&input_footprint_transportation_miles10=0' +
                '&input_footprint_transportation_mpg10=0' +
                '&input_footprint_transportation_fuel10=0';

            break;
          case 2:
            transportationUrlParam =
                '&input_footprint_transportation_miles1=0' +
                    '&input_footprint_transportation_mpg1=0' +
                    '&input_footprint_transportation_fuel1=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles2=${category.vehicle[1]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg2=${category.vehicle[1]?.mpgValue}' +
                    '&input_footprint_transportation_fuel2=${category.vehicle[1]?.fuelType}';
            transportationUrlParam =
                '&input_footprint_transportation_miles3=0' +
                    '&input_footprint_transportation_mpg3=0' +
                    '&input_footprint_transportation_fuel3=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles4=0' +
                    '&input_footprint_transportation_mpg4=0' +
                    '&input_footprint_transportation_fuel4=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles5=0' +
                    '&input_footprint_transportation_mpg5=0' +
                    '&input_footprint_transportation_fuel5=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles6=0' +
                    '&input_footprint_transportation_mpg6=0' +
                    '&input_footprint_transportation_fuel6=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles7=0' +
                    '&input_footprint_transportation_mpg7=0' +
                    '&input_footprint_transportation_fuel7=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles8=0' +
                    '&input_footprint_transportation_mpg8=0' +
                    '&input_footprint_transportation_fuel8=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles9=0' +
                    '&input_footprint_transportation_mpg9=0' +
                    '&input_footprint_transportation_fuel9=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles10=0' +
                    '&input_footprint_transportation_mpg10=0' +
                    '&input_footprint_transportation_fuel10=0';

            break;
          case 3:
            transportationUrlParam =
                '&input_footprint_transportation_miles1=0' +
                    '&input_footprint_transportation_mpg1=0' +
                    '&input_footprint_transportation_fuel1=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles2=0' +
                    '&input_footprint_transportation_mpg2=0' +
                    '&input_footprint_transportation_fuel2=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles3=${category.vehicle[2]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg3=${category.vehicle[2]?.mpgValue}' +
                    '&input_footprint_transportation_fuel3=${category.vehicle[2]?.fuelType}';
            transportationUrlParam =
                '&input_footprint_transportation_miles4=0' +
                    '&input_footprint_transportation_mpg4=0' +
                    '&input_footprint_transportation_fuel4=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles5=0' +
                    '&input_footprint_transportation_mpg5=0' +
                    '&input_footprint_transportation_fuel5=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles6=0' +
                    '&input_footprint_transportation_mpg6=0' +
                    '&input_footprint_transportation_fuel6=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles7=0' +
                    '&input_footprint_transportation_mpg7=0' +
                    '&input_footprint_transportation_fuel7=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles8=0' +
                    '&input_footprint_transportation_mpg8=0' +
                    '&input_footprint_transportation_fuel8=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles9=0' +
                    '&input_footprint_transportation_mpg9=0' +
                    '&input_footprint_transportation_fuel9=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles10=0' +
                    '&input_footprint_transportation_mpg10=0' +
                    '&input_footprint_transportation_fuel10=0';
            break;
          case 4:
            transportationUrlParam =
                '&input_footprint_transportation_miles1=0' +
                    '&input_footprint_transportation_mpg1=0' +
                    '&input_footprint_transportation_fuel1=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles2=0' +
                    '&input_footprint_transportation_mpg2=0' +
                    '&input_footprint_transportation_fuel2=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles3=0' +
                    '&input_footprint_transportation_mpg3=0' +
                    '&input_footprint_transportation_fuel3=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles4=${category.vehicle[3]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg4=${category.vehicle[3]?.mpgValue}' +
                    '&input_footprint_transportation_fuel4=${category.vehicle[3]?.fuelType}';
            transportationUrlParam =
                '&input_footprint_transportation_miles5=0' +
                    '&input_footprint_transportation_mpg5=0' +
                    '&input_footprint_transportation_fuel5=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles6=0' +
                    '&input_footprint_transportation_mpg6=0' +
                    '&input_footprint_transportation_fuel6=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles7=0' +
                    '&input_footprint_transportation_mpg7=0' +
                    '&input_footprint_transportation_fuel7=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles8=0' +
                    '&input_footprint_transportation_mpg8=0' +
                    '&input_footprint_transportation_fuel8=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles9=0' +
                    '&input_footprint_transportation_mpg9=0' +
                    '&input_footprint_transportation_fuel9=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles10=0' +
                    '&input_footprint_transportation_mpg10=0' +
                    '&input_footprint_transportation_fuel10=0';

            break;
          case 5:
            transportationUrlParam =
                '&input_footprint_transportation_miles5=${category.vehicle[4]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg5=${category.vehicle[4]?.mpgValue}' +
                    '&input_footprint_transportation_fuel5=${category.vehicle[4]?.fuelType}';
            transportationUrlParam =
                '&input_footprint_transportation_miles6=0' +
                    '&input_footprint_transportation_mpg6=0' +
                    '&input_footprint_transportation_fuel6=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles7=0' +
                    '&input_footprint_transportation_mpg7=0' +
                    '&input_footprint_transportation_fuel7=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles8=0' +
                    '&input_footprint_transportation_mpg8=0' +
                    '&input_footprint_transportation_fuel8=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles9=0' +
                    '&input_footprint_transportation_mpg9=0' +
                    '&input_footprint_transportation_fuel9=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles10=0' +
                    '&input_footprint_transportation_mpg10=0' +
                    '&input_footprint_transportation_fuel10=0';

            break;
          case 6:
            transportationUrlParam =
                '&input_footprint_transportation_miles1=0' +
                    '&input_footprint_transportation_mpg1=0' +
                    '&input_footprint_transportation_fuel1=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles2=0' +
                    '&input_footprint_transportation_mpg2=0' +
                    '&input_footprint_transportation_fuel2=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles3=0' +
                    '&input_footprint_transportation_mpg3=0' +
                    '&input_footprint_transportation_fuel3=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles4=0' +
                    '&input_footprint_transportation_mpg4=0' +
                    '&input_footprint_transportation_fuel4=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles5=0' +
                    '&input_footprint_transportation_mpg5=0' +
                    '&input_footprint_transportation_fuel5=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles6=${category.vehicle[5]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg6=${category.vehicle[5]?.mpgValue}' +
                    '&input_footprint_transportation_fuel6=${category.vehicle[5]?.fuelType}';
            transportationUrlParam =
                '&input_footprint_transportation_miles7=0' +
                    '&input_footprint_transportation_mpg7=0' +
                    '&input_footprint_transportation_fuel7=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles8=0' +
                    '&input_footprint_transportation_mpg8=0' +
                    '&input_footprint_transportation_fuel8=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles9=0' +
                    '&input_footprint_transportation_mpg9=0' +
                    '&input_footprint_transportation_fuel9=0';
            transportationUrlParam =
                '&input_footprint_transportation_miles10=0' +
                    '&input_footprint_transportation_mpg10=0' +
                    '&input_footprint_transportation_fuel10=0';
            break;
          case 7:
            transportationUrlParam =
                '&input_footprint_transportation_miles7=${category.vehicle[6]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg7=${category.vehicle[6]?.mpgValue}' +
                    '&input_footprint_transportation_fuel7=${category.vehicle[6]?.fuelType}';

            break;
          case 8:
            transportationUrlParam =
                '&input_footprint_transportation_miles8=${category.vehicle[7]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg8=${category.vehicle[7]?.mpgValue}' +
                    '&input_footprint_transportation_fuel8=${category.vehicle[7]?.fuelType}';

            break;
          case 9:
            transportationUrlParam =
                '&input_footprint_transportation_miles9=${category.vehicle[8]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg9=${category.vehicle[8]?.mpgValue}' +
                    '&input_footprint_transportation_fuel9=${category.vehicle[8]?.fuelType}';

            break;
          case 10:
            transportationUrlParam =
                '&input_footprint_transportation_miles10=${category.vehicle[9]?.totalDrivenPerYear}' +
                    '&input_footprint_transportation_mpg10=${category.vehicle[9]?.mpgValue}' +
                    '&input_footprint_transportation_fuel10=${category.vehicle[9]?.fuelType}';

            break;
        }
      } else if (category is Food) {
        print('\n');
        print('food object ${category.toString()}');
        foodUrlParam = '&input_footprint_shopping_food_meatfisheggs_default=0' +
            '&input_footprint_shopping_food_meatfisheggs=${category.meatFishEggs}' +
            '&input_footprint_shopping_food_cereals_default=${category.grainsAndBakedGoods}' +
            '&input_footprint_shopping_food_dairy=${category.diary}' +
            '&input_footprint_shopping_food_fruitvegetables=${category.fruitsAndVegatables}' +
            '&input_footprint_shopping_food_cereals=${category.snacksAndDrinks}' +
            '&input_footprint_shopping_food_meat_beefpork_default=${category.meatOtherBeefLambPork}' +
            '&input_footprint_shopping_food_meat_other_default=0' +
            '&input_footprint_shopping_food_otherfood=${category.otherMeat}' +
            '&input_footprint_shopping_food_meat_fish_default=${category.fishAndSeafood}' +
            '&input_footprint_shopping_food_meat_poultry_default=${category.poultryAndEggs}' +
            '&input_footprint_shopping_food_meattype=${category.isSimple}';
      } else {
        final goods = category as GoodsServices;
        print('\n');
        print('goods object ${goods.toString()}');
        goodsServicesUrlParam = '&input_footprint_shopping_goods_total=${goods.totalGoodsSpent}' +
            '&input_footprint_shopping_goods_default_furnitureappliances=0' +
            '&input_footprint_shopping_goods_other_total=0' +
            '&input_footprint_shopping_services_total=${goods.totalServiceSpent}' +
            '&input_footprint_shopping_goods_type=${goods.isSimple}' +
            '&input_footprint_shopping_goods_other_type=${goods.isSimple}' +
            '&input_footprint_shopping_services_type=${goods.isSimple}' +
            '&input_footprint_shopping_goods_furnitureappliances=${goods.furnitureAndAppliance}' +
            '&input_footprint_shopping_goods_default_clothing=0' +
            '&input_footprint_shopping_goods_clothing=${goods.clothing}' +
            '&input_footprint_shopping_goods_default_other_entertainment=0' +
            '&input_footprint_shopping_goods_other_entertainment=${goods.entertaining}' +
            '&input_footprint_shopping_goods_default_other_office=0' +
            '&input_footprint_shopping_goods_other_office=${goods.paperOfficeReading}' +
            '&input_footprint_shopping_goods_other_personalcare=${goods.personalCare}' +
            '&input_footprint_shopping_goods_default_other_personalcare=0' +
            '&input_footprint_shopping_goods_other_autoparts=${goods.autoParts}' +
            '&input_footprint_shopping_goods_default_other_autoparts=0' +
            '&input_footprint_shopping_goods_default_other_medical=0' +
            '&input_footprint_shopping_goods_other_medical=${goods.medical}' +
            '&input_footprint_shopping_services_type=${goods.isSimple}' +
            '&input_footprint_shopping_services_healthcare=${goods.healthCare}' +
            '&input_footprint_shopping_services_education=${goods.informationAndCommunication}' +
            '&input_footprint_shopping_services_communications=${goods.informationAndCommunication}' +
            '&input_footprint_shopping_services_vehicleservices=${goods.vehicleService}' +
            '&input_footprint_shopping_services_finance=${goods.personalFinance}' +
            '&input_footprint_shopping_services_household=${goods.houseHoldMaintenanceAndRepair}' +
            '&input_footprint_shopping_services_charity=${goods.organizationAndCharity}' +
            '&input_footprint_shopping_services_miscservices=${goods.otherService}';
      }
    });

    late final http.Response response;
    print('transportation end point= $transportationUrlParam');
    final endPointURL =
        '$refinedEndpoint$utilitiesUrlParam$transportationUrlParam$foodUrlParam$goodsServicesUrlParam$naturalUrlParam$heatingUrlParam&input_location_mode=1&input_location=$inputLocation&input_income=1&input_size=1&input_location_country=CA&input_footprint_household_adults=1&input_footprint_household_children=0&input_changed=0';
    print('\n');
    print('\n');
    print('all end point: $endPointURL');

    try {
      final url = Uri.parse(endPointURL);
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
      final decodedData = json.decode(responseBody) as Map<String, dynamic>;
      final double electricityVal = double.tryParse(
              '${decodedData['response']['result_electricity_direct']}') ??
          0;
      final double naturalVal = double.tryParse(
              '${decodedData['response']['result_natgas_direct']}') ??
          0;

      final double shelter =
          double.tryParse('${decodedData['response']['result_shelter']}') ?? 0;
      final double heatingVal = double.tryParse(
              '${decodedData['response']['result_heatingoil_direct']}') ??
          0;
      final energy = electricityVal + naturalVal + shelter + heatingVal;
      print('energy == $energy');
      final String grandTotal = decodedData['response']['result_grand_total'];
      final String airTravel =
          decodedData['response']['result_air_travel_direct'];
      final String vehicle =
          decodedData['response']['result_motor_vehicles_direct'];
      final String transit =
          decodedData['response']['result_publictrans_direct'];
      final String service = decodedData['response']['result_services_total'];
      final String food = decodedData['response']['result_food_total'];
      final String waterUsage = decodedData['response']['result_watersewage'];
      print('map values: ${questionaireMap.categoryMap}');
      print('questionaire obj: ${questionaireMap.toString()}');
      questionaireMap.result = questionaireMap.result.copyWith(
        resultGrandTotal: double.tryParse(grandTotal),
        resultAirTravelDirect: double.tryParse(airTravel),
        resultMotorVehiclesDirect: double.tryParse(vehicle),
        resultPublictransDirect: double.tryParse(transit),
        energy: energy,
        id: 'id',
        // category: questionaireMap.categoryMap,
        resultServicesTotal: double.tryParse(service),
        resultFoodTotal: double.tryParse(food),
        resultWaterSewage: double.tryParse(waterUsage),
      );

      try {
        // save data on location device;
        SharePref.saveQuestionaire(QUESTIONAIRE_RESULT_BOX, questionaireMap);
        // _questionaireBox.getQuestionaireResultBox
        //     .put(questionaireMap.result.id, questionaireMap.result);
      } catch (e) {
        throw ('Could not persist data in local storage');
      }

      print(
          'result transpor = ${decodedData['response']['result_grand_total']}');
      print('DECODED DATA: $decodedData');
      print('result model is: ${questionaireMap.result.toString()}');
    } catch (e) {
      throw ('could not fetch from refined api: $e');
    }
  }
}
