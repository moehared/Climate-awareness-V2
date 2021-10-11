import 'package:app/common/enums/view_state.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.IDLE;
  ViewState get viewState => _viewState;

  void setViewState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
