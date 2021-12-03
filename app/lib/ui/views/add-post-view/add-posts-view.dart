import 'package:app/domain/viewmodel/add-posts-viewmodel/add-post-view-model.dart';
import 'package:app/ui/views/add-post-view/addPost.dart';
import 'package:app/ui/widgets/forum-post-widget/create-post-widget.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';

class AddPostView extends StatelessWidget {
  static const routeName = '/AddPostView';

  AddPostView({
    Key? key,
    required this.addPostData,
  }) : super(key: key);

  final AddPostData addPostData;

  @override
  Widget build(BuildContext context) {
    print(addPostData.postId);
    return BuildViewModel<AddPostViewModel>(
      onModelReady: (model) => model.initState(addPostData),
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              model.userPostsModel.postId.isEmpty ? 'Add Post' : 'edit post'),
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
