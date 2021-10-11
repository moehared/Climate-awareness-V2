// ignore_for_file: file_names

import 'package:app/ui/widgets/image-widgets/logo_image.dart';
import 'package:flutter/material.dart';

class LoginWithThirdPartyApplication extends StatelessWidget {
  const LoginWithThirdPartyApplication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
