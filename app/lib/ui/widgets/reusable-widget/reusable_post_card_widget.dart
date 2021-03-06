import 'dart:io';
import 'package:app/common/utils/regex-patterns.dart';
import 'package:app/common/utils/show_pop-up_menu.dart';
import 'package:app/common/utils/url_link.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/widgets/edit-post-widget/edit-post-widget.dart';
import 'package:app/ui/widgets/youtube-player-widget/youtube-player.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/models/user_post_model.dart';

class ReusablePostCard extends StatelessWidget {
  final UserPostModel post;
  final String id;
  final String uuid;

  const ReusablePostCard({
    required this.post,
    required this.id,
    required this.uuid,
  });

  void playYoutubeVideo() {
    final navigationServices = locator<NavigationService>();
    navigationServices.navigateTo(PlayYoutubeVideo.routeName,
        argument: YoutubeData(title: post.description, videoId: post.url));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                post.category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
              onPressed: () => showPopUpMenu(
                  child: ShowEditPostPopUpMenu(
                    postId: post.postId,
                    userID: post.userId,
                  ),
                  context: context),
              //ToDo this should only appear with posts that belong to the user
              child: Text(
                'Edit Post',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      backgroundColor: Colors.pink,
                    ),
              ),
            ),
            // )
          ],
        ),
        Container(
          height: media.height * 0.25,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32),
                ),
                child: post.imageUrl.isNotEmpty
                    ? Image.network(
                        //post.imageUrl,
                        post.imageUrl,
                        width: double.infinity,
                        height: media.height * 0.4,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(post.imagePath),
                        width: double.infinity,
                        height: media.height * 0.4,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                bottom: 20,
                // right: 10,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      color: Colors.black54,
                      width: media.width * 0.60,
                      margin: const EdgeInsets.only(left: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Text(
                        post.description,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextButton(
                    child: post.category == "Article" ||
                            post.category == "Climate Awareness" ||
                            post.category == "Environment"
                        ? Text("Read", style: TextStyle(color: Colors.white))
                        : Text("Watch", style: TextStyle(color: Colors.white)),
                    onPressed: () => checkYoutubeURL(post.url)
                        ? playYoutubeVideo()
                        : launchInBrowser(post.url),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
