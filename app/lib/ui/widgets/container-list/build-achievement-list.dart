import 'package:app/common/utils/getcategory-obj.dart';
import 'package:app/domain/services/local_db/hive/boxes.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/main.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/models/Achievement-model.dart';

class BuildAchievementListContainer extends StatelessWidget {
  BuildAchievementListContainer({
    Key? key,
  }) : super(key: key);

  final _achievment = locator<Boxes<Achievement>>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          var data = achievmentMap.values.toList()[index];
          debugPrint('data is $data');
          return ReusableCard(
            id:  data.icon,
            subTitle:  data.description,
            imageAsset: data.icon,
          );
        },
        itemCount:  _achievment.getBox.values.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
