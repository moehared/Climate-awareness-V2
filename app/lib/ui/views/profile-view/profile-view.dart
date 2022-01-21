import 'dart:io';

import 'package:app/common/styles/style.dart';
import 'package:app/common/utils/getcategory-obj.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/main.dart';
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
                      getImage: () {}, //getImage,
                      // image: _image ?? ,
                      camera: () {},
                    ),
                    Text(
                      'test',
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
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        // var data = tipData.elementAt(index).values.toList();
                        var data = getCategoryObject(index);

                        print('data: $data');
                        // var data = tipData.elementAt(index);
                        // var data = newList.elementAt(index);
                        return ReusableCard(
                          id: data.questionID,
                          subTitle: data.title,
                          imageAsset: data.imageAsset,
                        );
                      },
                      // itemCount: questionaireMap.result.category!.length,
                      itemCount: questionaireMap.categoryMap.length,
                      scrollDirection: Axis.horizontal,
                    ),
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
                Text(
                  'under construction',
                  style: Theme.of(context).textTheme.bodyText1,
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

class UserAvatar extends StatelessWidget {
  final Function getImage;
  final Function camera;
  // final File image;
  const UserAvatar({
    Key? key,
    required this.getImage,
    // required this.image,
    required this.camera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          ClipRect(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
// borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.white, width: 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/person.png'),
                  // image: AssetImage('images/me.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            left: 60,
            top: 80,
            child: FocusedMenuHolder(
              blurSize: 5.0,
              animateMenuItems: true,
              openWithTap: true,
              menuWidth: media.size.width * 0.50,
              menuItems: [
                FocusedMenuItem(
                  title: Text('Camera'),
                  trailingIcon: Icon(Icons.camera_alt_rounded),
                  onPressed: camera,
                ),
                FocusedMenuItem(
                  title: Text('Gallery'),
                  trailingIcon: Icon(Icons.photo),
                  onPressed: getImage,
                ),
              ],
              onPressed: () {},
              child: Icon(
                Icons.camera_alt_rounded,
                color: Theme.of(context).colorScheme.secondary,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
