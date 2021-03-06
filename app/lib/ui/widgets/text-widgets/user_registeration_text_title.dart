import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user-registeration-viewmodel/user_registeration_viewmodel.dart';
import 'package:flutter/material.dart';

class UserRegisterationTitleText extends StatelessWidget {
  UserRegisterationTitleText({
    Key? key,
    required this.longTextTitle,
    required this.smallText,
  }) : super(key: key);
  final String longTextTitle;
  final bool smallText;
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UserRegisterationViewModel>(
      builder: (ctx, m, ch) => Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(
          longTextTitle,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto-Medium',
            fontSize: smallText == true ? 20 : 34.0,
          ),
        ),
      ),
    );
  }
}
