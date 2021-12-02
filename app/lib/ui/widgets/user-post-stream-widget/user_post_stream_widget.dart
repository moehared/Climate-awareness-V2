import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/loading_widget.dart';

import 'package:app/ui/widgets/reusable-widget/reusable_post_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPostStream extends StatelessWidget {
  const UserPostStream({
    this.filterByArticle = false,
    this.filterByMedia = false,
    this.user,
  });

  final bool filterByArticle;
  final bool filterByMedia;
  final user;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: firestore
            .collection(POST_COLLECTION)
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No Data exists',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          // filtered each post
          final post = filterByArticle
              ? snapshot.data!.docs.where((element) {
                  return !element.data().containsValue('Media');
                }).toList()
              : filterByMedia
                  ? snapshot.data!.docs.where((element) {
                      return element.data().containsValue('Media');
                    }).toList()
                  : snapshot.data!.docs;

          List<Widget> cardWidget = post.map<Widget>((e) {
            final userData = UserPostModel.fromMap(e.data());
            return ReusablePostCard(
              post: userData,
              id: userData.postId,
              uuid: userData.userId,
              
            );
          }).toList();
          return ListView.builder(
            key: PageStorageKey('user-post'),
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: post.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );
        });
  }
}
