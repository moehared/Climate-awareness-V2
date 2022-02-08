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

class SearchResults extends StatelessWidget {
  final List<String> toDisplay;

    const SearchResults(this.toDisplay);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: firestore
            .collection(USER_COLLECTION)
            .where('firstName', isGreaterThanOrEqualTo: searchKey)
            .where("firstName", isLessThan: searchKey + 'z')
            .snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return ErrorTextWidget(errorMsg: 'No Data exists');
          }
          // print("This is a ${snapshot.data!.docs}");
          // for (var item in snapshot.data!.docs) {
          //   print(item.data());
          // }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading());
          }
          final searchRes = snapshot.data!.docs;

          List<Widget> cardWidget = searchRes.map<Widget>((e) {
            final userData = UserModel.fromMap(e.data());

            return ListTile(
              title: Text("${userData.firstName} ${userData.lastName}"),
            );
          }).toList();

          if (cardWidget.isEmpty) {
            return ErrorTextWidget(
              errorMsg: 'Nothing To see.',
            );
          }

          return ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: searchRes.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );
        });
  }
}
