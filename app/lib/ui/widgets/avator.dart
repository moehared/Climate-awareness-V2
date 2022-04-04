import 'dart:io';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class UserAvatar extends StatelessWidget {
  final Function? getImage;
  final Function? camera;
  final File? image;
  const UserAvatar({
    Key? key,
    this.getImage,
    this.image,
    this.camera,

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
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
// borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.black, width: 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: image != null
                      ? FileImage(image!) as ImageProvider
                      : AssetImage('images/person.png'),
                  // image: AssetImage('images/me.jpg'),
                ),
              ),
            ),
          ),
          if(camera != null && getImage != null)
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
                  onPressed: camera!,
                ),
                FocusedMenuItem(
                  title: Text('Gallery'),
                  trailingIcon: Icon(Icons.photo),
                  onPressed: getImage!,
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
