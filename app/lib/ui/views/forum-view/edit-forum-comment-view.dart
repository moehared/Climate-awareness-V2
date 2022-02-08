import 'package:app/common/styles/style.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/expanded-forum-viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ForumCommentData {
  const ForumCommentData({required this.forumId, required this.commentId});
  final String forumId;
  final String commentId;
}

class EditForumCommentView extends StatelessWidget {
  static const routeName = '/EditForumComment';

  EditForumCommentView({
    Key? key,
    //required this.modelComment
    // required this.commentId,
    // required this.forumId,
    required this.forumCommentData
  }) : super(key: key);

  //Future<UserFourmCommentModel> modelComment;
  // final String forumId;
  // final String commentId;
  final ForumCommentData forumCommentData;

  @override
  Widget build(BuildContext context) {
    print("This is the commentID ${forumCommentData.commentId}");
    print("This is the forumId ${forumCommentData.forumId}");
    return BuildViewModel<ExpandedForumViewModel>(
        builder: (ctx, model, child) => SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  automaticallyImplyLeading: false,
                  brightness: Brightness.light,
                  title: Text('Edit Comment'),
                ),
                body: BackgroundImage(
                  backgroundImage: 'images/space2.png',
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Comment",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: model.editCommentController,
                            style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration:  userPostFormStyle.copyWith(
                               hintText: "${  model.getComment(forumCommentData.forumId , forumCommentData.commentId)}"
                              ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
