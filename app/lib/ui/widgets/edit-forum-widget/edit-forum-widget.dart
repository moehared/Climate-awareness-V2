import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/forum_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/forum-view/add-forum-view.dart';
import 'package:app/ui/views/forum-view/forum-view.dart';
import 'package:app/ui/widgets/user-setting-menu/build_tiles.dart';
import 'package:flutter/material.dart';

class ShowEditForumPopUpMenu extends StatelessWidget {
  const ShowEditForumPopUpMenu({
    Key? key,
    required this.forumId,
    required this.userID,
  }) : super(key: key);

  final String forumId;
  final String userID;

  @override
  Widget build(BuildContext context) {
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
                label: 'Edit Post',
                onTap: () {
                  if (locator<AuthService>().currentUser.get()!.uid != userID) {
                    print("You do no have access to this post");
                    return;
                  } else {
                    locator<NavigationService>()
                        .navigateTo(AddForumView.routeName, argument: forumId);
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
                  label: 'Delete Post',
                  onTap: () {
                    //check here maybe
                    if (locator<AuthService>().currentUser.get()?.uid !=
                        userID) {
                      //Todo: do a pop up here or a sliding window notification
                      print('You do not have access to this post');
                      return;
                    } else {
                      locator<ForumDatabaseService>().delete(forumId);
                      locator<NavigationService>()
                          .navigateTo(ForumView.routeName, argument: "");
                    }
                  },
                ),
              )),
          Visibility(
              visible: locator<AuthService>().currentUser.get()!.uid != userID
                  ? false
                  : true,
              child: Divider(color: Colors.black26)),
          BuildTile(
            iconData: Icons.share,
            label: 'Share',
            onTap: () {},
          ),
          Divider(color: Colors.black26),
          BuildTile(
            iconData: Icons.bookmark,
            label: 'Bookmark',
            onTap: () {},
          ),
          Divider(color: Colors.black26),
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
