import 'package:app/common/styles/style.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

class ForumView extends StatelessWidget {
  static const routeName = '/ForumView';
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ForumViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('Forum View'),
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: Center(
            child: Column(
              children: [
                Text(
                  'Forum view',
                  style: kTextTitleStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
