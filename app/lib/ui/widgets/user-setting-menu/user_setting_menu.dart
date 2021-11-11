import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:flutter/material.dart';
import 'build_tiles.dart';

class UserMenuPopUp extends StatelessWidget {
  // {this.iconData, this.label, this.onTap}
  final bool isEdit;
  final id;
  final String uuid;
  UserMenuPopUp({
    required this.isEdit,
    required this.id,
    required this.uuid,
    required this.command,
  });
  final ProfileViewModel command;
  @override
  Widget build(BuildContext context) {
    return isEdit == true && id != 0 && uuid.isNotEmpty
        ? StreamBuilder(
            // stream: userPost,
            builder: (ctx, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              // print(
              //     "user id: ${snapshot.data.user}\n current user id: ${user.currentUser.uid}\n");
              return Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (isEdit)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: BuildTile(
                          iconData: Icons.edit,
                          label: 'edit',
                          onTap: () {},
                        ),
                      ),
                    if (isEdit)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: BuildTile(
                          iconData: Icons.delete,
                          label: 'delete post',
                          onTap: () {},
                        ),
                      ),
                    if (!isEdit)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: BuildTile(
                          iconData: Icons.settings,
                          label: 'Setting',
                          onTap: () {},
                        ),
                      ),
                    if (isEdit) Divider(color: Colors.black26),
                    SizedBox(height: 5),
                    if (!isEdit)
                      BuildTile(
                        iconData: Icons.sanitizer_outlined,
                        label: 'Activity',
                        onTap: () {},
                      ),
                    if (!isEdit)
                      Divider(
                        color: Colors.black26,
                      ),
                    if (!isEdit) SizedBox(height: 5),
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
                    if (isEdit) Divider(color: Colors.black26),
                    if (isEdit) SizedBox(height: 5),
                    if (isEdit)
                      BuildTile(
                        iconData: Icons.report,
                        label: 'Report',
                        onTap: () {},
                      ),
                    if (!isEdit) Divider(color: Colors.black26),
                    SizedBox(height: 5),
                    if (!isEdit)
                      BuildTile(
                          iconData: Icons.logout,
                          label: 'Sign out',
                          onTap: command.signOut),
                    if (!isEdit) Divider(color: Colors.black26),
                    if (!isEdit) SizedBox(height: 5),
                    if (!isEdit)
                      BuildTile(
                        iconData: Icons.question_answer,
                        label: 'Questionnaire',
                        onTap: command.navigateToQuestionaireView,
                      ),
                  ],
                ),
              );
            },
          )
        : Container(
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
