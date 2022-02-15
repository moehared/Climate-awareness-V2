import 'package:app/common/config.dart';
import 'package:app/domain/models/user_forum_comment_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:app/ui/widgets/loading_widget.dart';
import 'package:app/ui/widgets/user-forum-stream-widget/forum-comment-cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FilterCommentsMenu extends StatelessWidget {
  const FilterCommentsMenu({
    required this.forumId,
    this.userComments = false,
    this.sortByOldest = false,
  });

  final bool userComments;
  final bool sortByOldest;
  final String forumId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: userComments
            ? firestore
                .collection(FORUM_COMMENT_COLLECTION)
                .doc(forumId)
                .collection("comments")
                .where("userId",
                    isEqualTo: locator<AuthService>().currentUser.get()!.uid)
                .snapshots()
            : firestore
                .collection(FORUM_COMMENT_COLLECTION)
                .doc(forumId)
                .collection("comments")
                .orderBy('date', descending: sortByOldest ? false : true)
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
