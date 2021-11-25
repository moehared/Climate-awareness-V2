import 'package:app/ui/widgets/forum-post-widget/create-post-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';

class AddPostView extends StatelessWidget {
  static const routeName = '/AddPostView';
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<AddPostViewModel>(
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Add Post'),
        ),
        body: BackgroundImage(
          backgroundImage: "images/space2.png",
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreateUserPost(model: model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
