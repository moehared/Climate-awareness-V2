import 'package:app/common/constant.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/locator.dart';

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
    return StreamBuilder<QuerySnapshot>(
        stream: firestore
           .collection(POST_COLLECTION)
            //.orderBy('date', descending: true)
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
      final post = snapshot.data!.docs;
      List<Widget> cardWidget = [];
      var id;
      UserPostModel userData;
      for (var p in post) {
        final data = p.data() as Map<String, dynamic>;
        id = p.id;
        userData = UserPostModel.fromMap(data);
        cardWidget.add(
          ReusablePostCard(
            post: userData,
            id: id,
            uuid: userData.userId,
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          // reverse: true,
          physics: BouncingScrollPhysics(),
          itemCount: cardWidget.length,
          itemBuilder: (_, index) {
            return cardWidget[index];
          },
        ),
      );
    });
  }
}
