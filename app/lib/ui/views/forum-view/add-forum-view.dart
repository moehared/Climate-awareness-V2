import 'package:app/common/styles/style.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/widgets/forum-widget/create-forum-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

//TODO: Add to route and add to locator
class AddForumView extends StatelessWidget {
  static const routeName = '/AddPostView';
  AddForumView({
    Key? key,
    required this.postId,
  }) : super(key: key);
  final String postId;
  @override
  Widget build(BuildContext context) {
    print(postId);
    return BuildViewModel<ForumViewModel>(
      onModelReady: (model) => model.initState(postId),
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
              model.userForumModel.forumId.isEmpty ? 'Add Forum Post' : 'Edit Forum Post'),
        ),
        body: BackgroundImage(
          backgroundImage: "images/space2.png",
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreateUserForum(model: model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
