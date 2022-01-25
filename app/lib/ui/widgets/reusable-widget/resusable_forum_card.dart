import 'package:app/common/utils/show_pop-up_menu.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/forum-view/expanded-forum-view.dart';
import 'package:app/ui/widgets/edit-forum-widget/edit-forum-widget.dart';
import 'package:app/ui/widgets/edit-post-widget/edit-post-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/models/user_forum_model.dart';

class ResuableForumCard extends StatelessWidget {
  final UserForumModel forum;
  final String id;
  final String uuid;

  const ResuableForumCard({
    required this.forum,
    required this.id,
    required this.uuid,
  });

  void goToExpandedView() {
    final navigationServices = locator<NavigationService>();
    navigationServices.navigateTo(ExpandedForumView.routeName, argument: id);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //TODO: Add profile picture
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
            onPressed: () => showPopUpMenu(
                child: ShowEditForumPopUpMenu(
                  forumId: forum.forumId,
                  userID: forum.userId,
                ),
                context: context),
            child: Text(
              'Edit Forum Post',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    backgroundColor: Colors.pink,
                  ),
            ),
          ),
        ],
      ),
      //This is for the background]
      GestureDetector(
        onTap: () => goToExpandedView(),
        child: Container(
          height: media.height * 0.25,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.grey[200],
                    //backgroundImage: Image.asset('images/image.png'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Text(forum.userDisplayName),
                    ],
                  ),
                  IconButton(
                      onPressed: () => {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("${forum.title}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.favorite,
                      size: 10.0,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Likes ${forum.likeCount}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    "Comment ${forum.commentCount}",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              )
            ],
          ),
        ),
        // child: Stack(alignment: Alignment.center, children: [
        //   ClipRRect(
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(32),
        //       ),
        //       child: Container(
        //         color: new Color.fromRGBO(255, 0, 0, 0.5),
        //       )),
        //   //User pp, name and forum topic
        //   Positioned(child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //     return Text(
        //       forum.title,
        //       style: TextStyle(
        //         fontSize: 20.0,
        //         color: Colors.white,
        //       ),
        //       maxLines: 1,
        //       softWrap: true,
        //       overflow: TextOverflow.ellipsis,
        //     );
        //   })),
        //   Positioned(
        //       top: 5,
        //       child: Row(
        //         children: [
        //           Text(
        //             forum.userDisplayName,
        //             style: TextStyle(
        //               fontSize: 15.0,
        //               color: Colors.white,
        //             ),
        //             maxLines: 1,
        //             softWrap: true,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             'Topic: ${forum.topic}',
        //             style: TextStyle(
        //               fontSize: 15.0,
        //               color: Colors.white,
        //             ),
        //             maxLines: 1,
        //             softWrap: true,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ],
        //       )),
        //   Positioned(
        //       bottom: 2,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Container(
        //               width: 80,
        //               height: 27,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(28),
        //                   color: Color(0xFFE5E5E5).withOpacity(0.5)),
        //               child: FittedBox(
        //                 child: Row(
        //                   children: [
        //                     Icon(
        //                       Icons.favorite_border_outlined,
        //                       color: Colors.white,
        //                       size: 10,
        //                     ),
        //                     Padding(padding: EdgeInsets.all(1)),
        //                     Text(
        //                       "Like ${forum.likeCount}",
        //                       textScaleFactor: 0.5,
        //                     )
        //                   ],
        //                 ),
        //               )),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Container(
        //             width: 80,
        //             height: 27,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(27),
        //                 color: Color(0xFFE5E5E5).withOpacity(0.5)),
        //             child: FittedBox(
        //                 child: Row(
        //               children: [
        //                 Icon(
        //                   Icons.mode_comment_outlined,
        //                   color: Colors.white,
        //                   size: 14,
        //                 ),
        //                 Padding(padding: EdgeInsets.all(2)),
        //                 Text("Comments ${forum.commentCount}")
        //               ],
        //             )),
        //           ),
        //         ],
        //       )),
        // ]),
      ),
    ]);
    //],
    //);
  }
}
