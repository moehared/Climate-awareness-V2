import 'package:app/common/styles/style.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/add-forum-viewmodel.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/expanded-forum-viewmodel.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/widgets/forum-widget/create-forum-widget.dart';
import 'package:app/ui/widgets/forum-widget/expanded-forum-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/user-forum-stream-widget/user-forum-comment-stream.dart';
import 'package:flutter/material.dart';

//TODO: Add to route and add to locator
class ExpandedForumView extends StatelessWidget {
  static const routeName = '/ExpandedForumView';

  ExpandedForumView({
    Key? key,
    required this.forumId,
  }) : super(key: key);
  final String forumId;

  @override
  Widget build(BuildContext context) {
    print(forumId);
    return BuildViewModel<ExpandedForumViewModel>(
      onModelReady: (model) => model.initState(forumId),
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(model.userForumModel.forumId.isEmpty
              ? 'Forum Detail'
              : '${model.userForumModel.title}'),
        ),
        body: Container(
          //backgroundImage: "images/space2.png",
          child: SafeArea(
          
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text("this is the expanded View ${forumId}"),
                  ExpandedForumWidget(model: model,),
                  UserCommentForumStream(
                      fourmId: !model.userForumModel.forumId.isEmpty
                          ? model.userForumModel.forumId
                          : " "),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
