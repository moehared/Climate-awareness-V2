import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/add-post-view/add-posts-view.dart';
import 'package:app/ui/widgets/user-setting-menu/build_tiles.dart';
import 'package:flutter/material.dart';

class ShowEditPostMenu extends StatelessWidget {
  const ShowEditPostMenu({Key? key, required this.postId, required this.userID,}) : super(key: key);

  final String postId;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BuildTile(
              iconData: Icons.edit,
              label: 'edit',
              onTap: () {
                locator<NavigationService>().navigateTo(AddPostView.routeName,argument: postId);
              },
            ),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BuildTile(
              iconData: Icons.delete,
              label: 'delete post',
              onTap: () {},
            ),
          ),
          Divider(color: Colors.black26),
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
