import 'package:app/common/config.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:app/ui/widgets/loading_widget.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_post_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/reusable-widget/resusable_forum_card.dart';
import 'package:app/domain/models/user_forum_model.dart';
import 'package:app/ui/widgets/reusable-widget/resusable_forum_card.dart';
import 'package:app/domain/models/user_model.dart';

import 'forum-comment-cards.dart';

class UserCommentForumStream extends StatelessWidget {

  final String fourmId;

    const UserCommentForumStream({
    required this.fourmId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: firestore
            .collection(FORUM_COMMENT_COLLECTION).doc(fourmId).collection("comments")
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return ErrorTextWidget(errorMsg: 'No Data exists');
          }
          //print("This is a ${snapshot.data!.docs}");
          // for (var item in snapshot.data!.docs) {
          //   print(item.data());
          // }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading());
          }
          final comment = snapshot.data!.docs;

          List<Widget> cardWidget = comment.map<Widget>((e) {
            final userData = UserFourmCommentModel.fromMap(e.data());

            return ForumCommentCard(
              commentForumModel: userData,
            );
          }).toList();

          if (cardWidget.isEmpty) {
            return ErrorTextWidget(
              errorMsg: 'No Comments.',
            );
          }
          return ListView.builder(
            //key: PageStorageKey('user-forum'),
            // scrollDirection: Axis.vertical,
            // physics: BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: comment.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );
        });
  }
}
