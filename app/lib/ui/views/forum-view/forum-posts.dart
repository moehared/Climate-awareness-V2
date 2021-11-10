import 'package:app/ui/widgets/forum-post-widget/create-post-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:app/ui/widgets/forum-post-widget/drop-down-widget.dart';
import 'package:app/domain/models/user_post_model.dart';

class ForumView extends StatelessWidget {
  static const routeName = '/ForumView';
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ForumPostViewModel>(
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Forums'),
        ),
        body: BackgroundImage(
          backgroundImage: "images/space2.png",
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      CreateForumPost(model: model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
