// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../base_viewmodel/baseview_model.dart';

class CommunityViewModel extends BaseViewModel {
  late final TabController _tabController;

  void initState(TickerProvider tickerProvider) {
    _tabController = TabController(length: 3, vsync: tickerProvider);
  }

  TabController get tabController => _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
