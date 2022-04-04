import 'dart:io';

import 'package:app/common/styles/style.dart';
import 'package:app/common/utils/getcategory-obj.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/main.dart';
import 'package:app/ui/widgets/avator.dart';
import 'package:app/ui/widgets/container-list/build-achievement-list.dart';
import 'package:app/ui/widgets/container-list/build-container-list.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/ProfileView';
  const ProfileView({
    Key? key,
    this.carbonScore,
  }) : super(key: key);
  final double? carbonScore;
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ProfileViewModel>(
      onModelReady: (model) => model.initState(),
      builder: (ctx, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert_rounded,
              ),
              onPressed: () => model.showPopUpMenu(model),
            ),
          ],
        ),
        body: BackgroundImage(
          backgroundImage: "images/space2.png",
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UserAvatar(
                      image: model.image,
                      getImage: () =>
                          model.uploadImageOrOpenCamera(true), //getImage,
                      // image: _image ?? ,
                      camera: model.uploadImageOrOpenCamera,
                    ),
                    Text(
                      '${model.user?.firstName} ${model.user?.lastName}',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto-Medium'),
                    ),
                  ],
                ),
                Divider(color: Colors.white24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: RichText(
                          text: TextSpan(
                              text: 'Carbon Score:',
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${questionaireMap.result.resultGrandTotal?.toStringAsFixed(2) ?? 0} tons CO2eq/month',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Bold',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: model.showChartDetailsView,
                      child: Text(
                        'View Details',
                        style: kTextButtonStyle(context),
                      ),
                    ),
                  ],
                ),
                // ResultChart(carbonScore ?? 0),
                Divider(color: Colors.white24),
                TitleAndButton(
                  title: 'Personalized Tips',
                  viewAll: model.navigateToViewAll,
                ),
                // categories,
                // if (questionaireMap.result.category != null && questionaireMap.result.category!.isNotEmpty)
                if (questionaireMap.categoryMap.isNotEmpty)
                  BuildListContainer(
                    length: questionaireMap.categoryMap.length,
                  ),
                if (questionaireMap.categoryMap.isEmpty)
                  Center(
                    child: Text(
                      'No personalized tips yet. start answering questionnaires',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                SizedBox(height: 5),
                Divider(color: Colors.white24),
                TitleAndButton(
                  title: 'Achievement',
                  viewAll: () {},
                ),
                // BuildListContainer(
                //   isAchievement: true,
                // ),
                if (achievmentMap.isNotEmpty)
                  BuildListContainer(
                    length: achievmentMap.length,
                    isAchievement: true,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleAndButton extends StatelessWidget {
  final String title;
  final void Function()? viewAll;

  const TitleAndButton({
    Key? key,
    required this.title,
    required this.viewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: viewAll,
          child: Text(
            'View All',
            style: kTextButtonStyle(context),
          ),
        ),
      ],
    );
  }


}
