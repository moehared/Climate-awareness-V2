import 'dart:io';

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
  final File? image;
  const ResuableForumCard({
    required this.forum,
    required this.id,
    required this.uuid,
    this.image,
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
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 15,
        )
        //   TextButton(
        //     style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
        //     onPressed: () => showPopUpMenu(
        //         child: ShowEditForumPopUpMenu(
        //           forumId: forum.forumId,
        //           userID: forum.userId,
        //         ),
        //         context: context),
        //     child: Text(
        //       'Edit Forum Post',
        //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //             backgroundColor: Colors.pink,
        //           ),
        //     ),
        //   ),
      ]),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    // backgroundColor: image == null ? Colors.grey[200] : null,
                    backgroundImage: image != null
                        ? FileImage(image!) as ImageProvider
                        : null,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Text(forum.userDisplayName),
                    ],
                  ),
                  const SizedBox(
                    width: 150.0,
                  ),
                  IconButton(
                      onPressed: () => showPopUpMenu(
                          child: ShowEditForumPopUpMenu(
                            forumId: forum.forumId,
                            userID: forum.userId,
                          ),
                          context: context),
                      icon: const Icon(Icons.more_horiz)
                      )
                ],
              ),
              const SizedBox(
                height: 2.5,
              ),
              Row(children: [
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Topic: ${forum.topic}",
                  style: TextStyle(fontSize: 10),
                  maxLines: 1,
                ),
              ]),
              const SizedBox(
                height: 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:  Text(
                      "${forum.title}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
                 
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${forum.description}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${forum.date}",
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
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
                    forum.likeCount == 0
                        ? "Likes "
                        : "Likes ${forum.likeCount}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
                    child: const Icon(
                      Icons.comment,
                      size: 10.0,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Comments ${forum.commentCount}",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
