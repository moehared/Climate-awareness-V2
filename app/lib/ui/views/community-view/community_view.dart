import 'package:app/common/constant.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/community_viewmodel/community_viewmodel.dart';
import 'package:app/ui/widgets/filter-views/all_view.dart';
import 'package:app/ui/widgets/filter-views/article_view.dart';
import 'package:app/ui/widgets/filter-views/media_view.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatefulWidget {
  static const routeName = '/CommunityView';
  const CommunityView({Key? key}) : super(key: key);

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<CommunityViewModel>(
      onModelReady: (model) => model.initState(this),
      builder: (ctx, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            brightness: Brightness.light,
            title: Text('Community'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                // add form widget
                onPressed: model.navigateToAddPostView,
              ),
            ],
          ),
          body: BackgroundImage(
            backgroundImage: 'images/space2.png',
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    controller: model.tabController,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    tabs: [
                      Text('All'),
                      Text('Article'),
                      Text('Media'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: model.tabController,
                    children: [
                      AllViews(),
                      ArticleView(),
                      MediaView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
