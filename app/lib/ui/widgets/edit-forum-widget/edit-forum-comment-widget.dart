import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/forum_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/community-view/community_view.dart';
import 'package:app/ui/views/forum-view/add-forum-view.dart';
import 'package:app/ui/views/forum-view/edit-forum-comment-view.dart';
import 'package:app/ui/views/forum-view/forum-view.dart';
import 'package:app/ui/widgets/user-setting-menu/build_tiles.dart';
import 'package:flutter/material.dart';

class ShowEditForumCommentPopUpMenu extends StatelessWidget {
  const ShowEditForumCommentPopUpMenu({
    Key? key,
    required this.forumId,
    required this.commentId,
    required this.userID,
  }) : super(key: key);

   final String forumId;
  final String commentId;
  final String userID;
 

  @override
  Widget build(BuildContext context) {
    print("this is forumId ${forumId}");
    print("This is commentId ${commentId}");
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Visibility(
              visible: locator<AuthService>().currentUser.get()!.uid != userID
                  ? false
                  : true,
              child: BuildTile(
                iconData: Icons.edit,
                label: 'Edit Comment',
                onTap: () {
                  if (locator<AuthService>().currentUser.get()!.uid != userID) {
                    print("You do no have access to this comment");
                    return;
                  } else {
                    locator<NavigationService>()
                        .navigateTo(
                        EditForumCommentView.routeName, argument: ForumCommentData(forumId: forumId, commentId: commentId));
                  }
                },
              ),
            ),
          ),
          Visibility(
              visible: locator<AuthService>().currentUser.get()!.uid != userID
                  ? false
                  : true,
              child: Divider(color: Colors.black26)),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Visibility(
                visible: locator<AuthService>().currentUser.get()!.uid != userID
                    ? false
                    : true,
                child: BuildTile(
                  iconData: Icons.delete,
                  label: 'Delete Comment',
                  onTap: () {
                    //check here maybe
                    if (locator<AuthService>().currentUser.get()?.uid !=
                        userID) {
                      //Todo: do a pop up here or a sliding window notification
                      print('You do not have access to this comment');
                      return;
                    } else {
                      locator<ForumDatabaseService>().deleteComment(commentId,forumId);
                      locator<NavigationService>()
                          .navigateTo(CommunityView.routeName, argument: "");
                    }
                  },
                ),
              )),
          Visibility(
              visible: locator<AuthService>().currentUser.get()!.uid != userID
                  ? false
                  : true,
              child: Divider(color: Colors.black26)),
          // BuildTile(
          //   iconData: Icons.share,
          //   label: 'Share',
          //   onTap: () {},
          // ),
          // Divider(color: Colors.black26),
          // BuildTile(
          //   iconData: Icons.bookmark,
          //   label: 'Bookmark',
          //   onTap: () {},
          // ),
          // Divider(color: Colors.black26),
          BuildTile(
            iconData: Icons.report,
            label: 'Report',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
