import 'package:app/common/utils/getcategory-obj.dart';
import 'package:app/domain/services/local_db/hive/boxes.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/main.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/models/Achievement-model.dart';

class BuildListContainer extends StatelessWidget {
  BuildListContainer({
    Key? key,
    this.length,
    this.isAchievement = false,
  }) : super(key: key);
  final int? length;
  final bool isAchievement;
  final _achievment = locator<Boxes<Achievement>>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          var data = !isAchievement
              ? getCategoryObject(index)
              : achievmentMap.values.toList()[index];
          return ReusableCard(
            //TODO: to view achievement, pass an id; for now id is empty
            id: isAchievement ? '' : data.questionID,
            subTitle: isAchievement ? data.achievementTypes : data.title,
            imageAsset: isAchievement ? data.icon : data.imageAsset,
          );
        },
        itemCount: length == null ? achievmentMap.values.length : length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
