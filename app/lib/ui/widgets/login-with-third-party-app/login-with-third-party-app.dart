// ignore_for_file: file_names

import 'package:app/ui/widgets/image-widgets/logo_image.dart';
import 'package:app/ui/widgets/text-widgets/user_registeration_text_title.dart';
import 'package:flutter/material.dart';

class LoginWithThirdPartyApplication extends StatelessWidget {
  const LoginWithThirdPartyApplication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserRegisterationTitleText(
          longTextTitle: "Or Login with",
          smallText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            LogoImageAvatar(
              imageAsset: 'images/facebook.png',
              isCircle: true,
            ),
            LogoImageAvatar(
              imageAsset: 'images/google.png',
              isCircle: true,
            ),
          ],
        ),
      ],
    );
  }
}
