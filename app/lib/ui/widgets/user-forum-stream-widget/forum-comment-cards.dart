import 'package:app/common/utils/show_pop-up_menu.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/forum-view/expanded-forum-view.dart';
import 'package:app/ui/widgets/edit-forum-widget/edit-forum-comment-widget.dart';
import 'package:app/ui/widgets/edit-post-widget/edit-post-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/models/user_forum_model.dart';

class ForumCommentCard extends StatelessWidget {
  final UserFourmCommentModel commentForumModel;

  const ForumCommentCard({
    required this.commentForumModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.grey[200],
                    //backgroundImage: Image.asset('images/image.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${commentForumModel.userName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () => showPopUpMenu(
                          child: ShowEditForumCommentPopUpMenu(
                            forumId: commentForumModel.forumId,
                            commentId: commentForumModel.commentId,
                            userID: commentForumModel.userId,
                          ),
                          context: context),
                      icon: const Icon(Icons.more_horiz))
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                '${commentForumModel.userComment}',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              // Divider(color: Colors.black),
              Row(
                children: [
                  Text(
                    "${commentForumModel.date}",
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  )
                ],
              ),
              Divider(color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
