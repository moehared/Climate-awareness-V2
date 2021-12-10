import 'package:app/common/constant.dart';
import 'package:app/common/enums/view_state.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/models/place-model/suggestion_place.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/services/network_service/questionaires_endpoint/network_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:app/ui/views/tab-views/tab-views.dart';
import 'package:flutter/material.dart';

class QuickCarbonViewModel extends BaseViewModel {
  final _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final _dialogService = locator<DiaglogService>();
  final _navService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _authService = locator<AuthService>();
  final _userAccountService = locator<AccountDatabaseService>();
  var _houseHoldSizeValue = 0.0;
  var _houseHoldIncomeValue = 0.0;
  List<SuggestionPlace> _placeList = [];
  TextEditingController get textController => _textController;
  FocusNode get textFocusNode => _textFocusNode;
  List<SuggestionPlace> get placeList => _placeList;

  double get houseHoldSize => _houseHoldSizeValue;
  double get houseHoldIncome => _houseHoldIncomeValue;

  Future quickCarbonEstimate() async {
    if (_textController.text.isEmpty) return;
    setViewState(ViewState.BUSY);
    debugPrint('city: ${_textController.text}');
    debugPrint('house hold size: ${houseHoldSize.toInt()}');
    debugPrint('house hold income: ${houseHoldIncome.toInt()}');
    debugPrint('postal code: ${_textController.text.trim()}');
    try {
      final result =
          await _networkService.defaultCarbonFootPrintCalculatorByPostalCode(
        postalCode: _textController.text,
        income: houseHoldIncome.toInt().toString(),
        size: houseHoldSize.toInt().toString(),
      );
      // fetch current user info
      //TODO: Save user carbon footprint locally
      // var userModel = await _userAccountService
      //     .fetchUserModel(_authService.currentUser.get()!.uid);

      // userModel = userModel.copyWith(c02Score: result);
      // // update current user carbon footprint
      // await _userAccountService.updateUser(userModel);
      setViewState(ViewState.IDLE);
//TODO: find another to pass info to the profile.maybe save user local device
// TODO: re-direct user to the profile tab
      final directSelectedPageIndex = 4;
      _navService.navigateAndReplce(
        TabViews.routeName,
        argument: directSelectedPageIndex,
      );
    } catch (e) {
      throw ('error occured while calculating carbon footprint $e');
    }
  }

  void refineEstimate() {
    _navService.navigateTo(QuestionaireView.routeName);
  }

  void initState(ctx) {
    _textFocusNode.removeListener(() => _dispose());
  }

  void _dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
  }
// TODO: fetch city places 
  // Future fetchPlaces(city) async {
  //   try {
  //     _placeList = await _networkService.fetchPlaces(city);
  //     notifyListeners();
  //   } catch (e) {
  //     if (e.toString().contains('ZERO_RESULTS')) {
  //       this._textFocusNode.unfocus();
  //       promptDialog(
  //         message: "we could not find the city '$city' You have entered",
  //         dialogService: _dialogService,
  //         title: 'No city found',
  //       );

  //       // return;
  //     } else {
  //       promptDialog(
  //         message: 'Could not Fetch city',
  //         dialogService: _dialogService,
  //         title: 'Something went wrong!',
  //       );
  //     }
  //   }
  // }

  Future<void> onSelectedCity(SuggestionPlace? city) async {
    if (city == null) return;
    this._textController.text = city.name;
    this._textFocusNode.unfocus();
    // await this._networkService.getPlaceDetails(city.placeID);
    this._placeList = [];
    notifyListeners();
  }

  void showHousePeopleInfo() {
    promptDialog(
      message: HOUSE_HOLD_PEOPLE_INFO,
      dialogService: _dialogService,
      title: HOUSE_HOLD_QUESTION,
    );
  }

  void showHouseHoldIncomeInfo() {
    promptDialog(
      message: HOUSE_HOLD_INCOME_INFO,
      dialogService: _dialogService,
      title: HOUSE_HOLD_INCOME,
    );
  }

  void onHouseHoldSizeValueChange(double val) {
    this._houseHoldSizeValue = val;
    notifyListeners();
  }

  void onHouseHoldIncomeValueChange(double val) {
    this._houseHoldIncomeValue = val;
    notifyListeners();
  }

  String getHouseHoldSizeLabel(int people) {
    switch (people) {
      case 0:
        return 'Average (2.5 persons)';
      case 1:
        return '1 People';
      case 2:
        return '2 people';
      case 3:
        return '3 People';
      case 4:
        return '4 people';
      case 5:
        return '5 or more people';
      default:
        return '';
    }
  }

  String getHouseHoldIncomeLabel(int people) {
    switch (people) {
      case 1:
        return 'Average (\$60,000)';
      case 2:
        return 'Less than \$10,000';
      case 3:
        return '\$10,000 to \$19,999';
      case 4:
        return '\$20,000 to \$29,999';
      case 5:
        return '\$30,000 to \$39,999';
      case 6:
        return '\$40,000 to \$49,999';
      case 7:
        return '\$50,000 to \$59,999';
      case 8:
        return '\$60,000 to \$79,999';
      case 9:
        return '\$80,000 to \$99,999';
      case 10:
        return '\$100,000 to \$119,999';
      case 11:
        return '\$120,000 or more';
      default:
        return '';
    }
  }
}
