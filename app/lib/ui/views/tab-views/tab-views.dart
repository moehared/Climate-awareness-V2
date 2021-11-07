import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/tab_viewmodel.dart/tab_viewmodel.dart';

import 'package:flutter/material.dart';

class TabViews extends StatelessWidget {
  static const String routeName = '/TabViews';
  const TabViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<TabViewModel>(
      onModelReady: (model) => model.init(),
      builder: (ctx, model, child) => SafeArea(
        child: Scaffold(
          body: model.pages[model.selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white54,
            currentIndex: model.selectedPageIndex,
            selectedItemColor: Colors.white,
            onTap: model.selectPage,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Theme.of(context).primaryColor,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.location_on),
                label: 'Near by',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.forum_outlined),
                label: 'Forum post',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
