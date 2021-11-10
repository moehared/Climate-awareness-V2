import 'dart:io';

import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/ProfileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tipData = [];
    File? _image;

    return BuildViewModel<ProfileViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert_rounded,
              ),
              onPressed: () {},
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
                Divider(color: Colors.black26),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Text(
                    'Carbon Footprint Score',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      color: Colors.white,
                    ),
                  ),
                ),
                // ResultChart(res ?? 0),
                Divider(color: Colors.black26),
                TitleAndButtonRow(
                  title: 'Personalized Tips',
                  viewAll: () {},
                ),
                // categories,
                if (tipData.isNotEmpty)
                  Container(
                    // height: height >= 926 ? height * 0.15 : height * 0.20,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        // var data = tipData.elementAt(index).values.toList();
                        var data = tipData.elementAt(index);
                        // var data = tipData.elementAt(index);
                        // var data = newList.elementAt(index);
                        return ReusableCard(
                          // id: data.id,
                          // imageAsset: data.image,
                          // subTitle: data.subTitle,
                          id: data['id'],
                          imageAsset: data['image'],
                          subTitle: data['subtitle'],
                        );
                      },
                      itemCount: tipData.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                if (tipData.isEmpty)
                  Center(
                    child: Text(
                      'No personalized tips yet. start answering questionnaires',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                SizedBox(height: 5),
                Divider(color: Colors.black26),
                TitleAndButtonRow(
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

class TitleAndButtonRow extends StatelessWidget {
  final String title;
  final Function viewAll;

  const TitleAndButtonRow({
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
          onPressed: () {},
          child: Text(
            'View All',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
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
