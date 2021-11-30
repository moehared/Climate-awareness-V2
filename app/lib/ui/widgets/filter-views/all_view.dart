import 'package:app/common/constant.dart';
import 'package:app/ui/widgets/user-post-stream-widget/user_post_stream_widget.dart';
import 'package:flutter/material.dart';

class AllViews extends StatelessWidget {
  const AllViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: Theme.of(context).scrollbarTheme,
      child: Scrollbar(
        child: PageStorage(
          bucket: bucketStorage,
          child: UserPostStream(
            filterByArticle: false,
            filterByMedia: false,
          ),
        ),
      ),
    );
  }
}
