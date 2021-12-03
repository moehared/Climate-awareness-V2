// ignore_for_file: file_names

import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/add-post-view/add-posts-view.dart';
import 'package:app/ui/views/add-post-view/addPost.dart';
import 'package:flutter/material.dart';

import '../base_viewmodel/baseview_model.dart';

class CommunityViewModel extends BaseViewModel {
  late final TabController _tabController;
  final _navService = locator<NavigationService>();
  String postId = "";

  void initState(TickerProvider tickerProvider) {
    _tabController = TabController(length: 3, vsync: tickerProvider);
  }

  TabController get tabController => _tabController;

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void navigateToAddPostView() {
    _navService.navigateTo(AddPostView.routeName,
        argument: AddPostData(postId));
  }
}
