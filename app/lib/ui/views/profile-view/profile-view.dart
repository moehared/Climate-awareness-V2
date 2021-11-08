import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/ProfileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BuildViewModel<ProfileViewModel>(
    //   builder: (ctx, model, child) => Scaffold(
    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       title: const Text('Profile View'),
    //     ),
    //     body: SafeArea(
    //       child: Center(child: Text('Profile View')),
    //     ),
    //   ),
    // );
    return BuildViewModel<ProfileViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile View'),
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: SafeArea(
            child: Center(child: Text('Profile View')),
          ),
        ),
      ),
    );
  }
}
