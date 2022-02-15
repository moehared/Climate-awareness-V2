import 'package:app/common/constant.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/ui/widgets/user-forum-stream-widget/user_forum_stream_widget.dart';
import 'package:app/ui/widgets/user-post-stream-widget/user_post_stream_widget.dart';
import 'package:flutter/material.dart';

class AllForumViews extends StatelessWidget {
  const AllForumViews({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ForumViewModel model;
  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: Theme.of(context).scrollbarTheme,
      child: Scrollbar(
        child: PageStorage(
          bucket: bucketStorage,
          child: UserForumStream(image: model.image,),
        ),
      ),
    );
  }
}
