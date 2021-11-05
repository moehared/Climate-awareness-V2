import 'package:app/common/utils/optional.dart';
import 'package:flutter/material.dart';

/// credit: from filled stack youtube tutorial. 

class NavigationService {
  final _navKey = Optional.of(GlobalKey<NavigatorState>());
  GlobalKey<NavigatorState> get navigationKey => _navKey.get();

  void pop() {
    if (_navKey.isPresent()) {
      return _navKey.get().currentState!.pop();
    }
  }

  Future navigateTo(String routeName, {Object? argument}) {
    return argument == null 
        ? _navKey.get().currentState!.pushNamed(routeName)
        : _navKey.get().currentState!.pushNamed(routeName, arguments: argument);
  }

  Future navigateAndReplce(String routeName, {Object? argument}) {
    return argument == null
        ? _navKey.get().currentState!.pushReplacementNamed(routeName)
        : _navKey.get().currentState!
            .pushReplacementNamed(routeName, arguments: argument);
  }
}
