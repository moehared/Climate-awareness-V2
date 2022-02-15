import 'dart:io';

import 'package:app/common/config.dart';
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

class UserForumStream extends StatelessWidget {
  final bool sortByEnvironment;
  final bool sortByClimate;
  final bool sortByHelp;
  final bool sortByOther;
  final File? image;
  const UserForumStream(
      {this.sortByEnvironment = false,
      this.sortByClimate = false,
      this.sortByHelp = false,
      this.sortByOther = false,
      this.image
      });

  @override
  dynamic filterForum() {
    if (sortByEnvironment) {
      return firestore
          .collection(FORUM_COLLECTION)
          .where("topic", isEqualTo: "Environment")
          .snapshots();
    } else if (sortByClimate) {
      return firestore
          .collection(FORUM_COLLECTION)
          .where("topic", isEqualTo: 'Climate Awareness')
          .snapshots();
    } else if (sortByHelp) {
      return firestore
          .collection(FORUM_COLLECTION)
          .where("topic", isEqualTo: "Help")
          .snapshots();
    }
    else if (sortByOther) {
      return firestore
          .collection(FORUM_COLLECTION)
          .where("topic", isEqualTo: "Other")
          .snapshots();
    }
    else{
      return firestore
      .collection(FORUM_COLLECTION)
      .orderBy("date", descending: true)
      .snapshots();
    }
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: filterForum(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return ErrorTextWidget(errorMsg: 'No Data exists');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading());
          }
          final post = snapshot.data!.docs;

          List<Widget> cardWidget = post.map<Widget>((e) {
            final userData = UserForumModel.fromMap(e.data());

            return ResuableForumCard(
              forum: userData,
              id: userData.forumId,
              uuid: userData.userId,
              image: image,
            );
          }).toList();

          if (cardWidget.isEmpty) {
            return ErrorTextWidget(
              errorMsg: 'Nothing To see.',
            );
          }

          return ListView.builder(
            //key: PageStorageKey('user-forum'),
            // scrollDirection: Axis.vertical,
            // physics: BouncingScrollPhysics(),

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: post.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );
        });
  }
}