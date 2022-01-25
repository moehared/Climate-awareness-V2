import 'package:app/common/styles/style.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/views/forum-view/all-forum-view.dart';
import 'package:app/ui/widgets/forum-widget/create-forum-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/user-forum-stream-widget/user_forum_stream_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/reusable-widget/resusable_forum_card.dart';

class ForumView extends StatefulWidget {
  static const routeName = '/ForumView';
  const ForumView({Key? key}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumView();
}

class _ForumView extends State<ForumView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ForumViewModel>(
        //onModelReady: (model) => model.initState(this),
        builder: (ctx, model, child) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  automaticallyImplyLeading: false,
                  brightness: Brightness.light,
                  title: Text('Forum'),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AllForumViews(),
                      ],
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     Container(
                  //       height: 30,
                  //       decoration: BoxDecoration(
                  //         color: Theme.of(context).primaryColorLight,
                  //       ),
                  //     ),
                  //     AllForumViews()
                  //   ],
                  // ),
                ),
              ),
            ));
  }
}
