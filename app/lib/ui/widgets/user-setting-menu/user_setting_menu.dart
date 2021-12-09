import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';

import 'package:flutter/material.dart';
import 'build_tiles.dart';

class ProfileMenuPopUp extends StatelessWidget {
  const ProfileMenuPopUp({
    required this.command,
  });
  final ProfileViewModel command;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BuildTile(
              iconData: Icons.settings,
              label: 'Setting',
              onTap: () {},
            ),
          ),
          Divider(color: Colors.black26),
          SizedBox(height: 5),
          BuildTile(
            iconData: Icons.sanitizer_outlined,
            label: 'Activity',
            onTap: () {},
          ),
          Divider(
            color: Colors.black26,
          ),
          BuildTile(
            iconData: Icons.share,
            label: 'Share',
            onTap: () {},
          ),
          Divider(color: Colors.black26),
          SizedBox(height: 5),
          BuildTile(
            iconData: Icons.bookmark,
            label: 'Bookmark',
            onTap: () {},
          ),
          Divider(color: Colors.black26),
          SizedBox(height: 5),
          BuildTile(
            iconData: Icons.logout,
            label: 'Sign out',
            onTap: () {
              command.signOut();
            },
          ),
          Divider(color: Colors.black26),
          SizedBox(height: 5),
          BuildTile(
            iconData: Icons.question_answer,
            label: 'Questionnaire',
            onTap: command.navigateToQuestionaireView,
          ),
        ],
      ),
    );
  }
}
