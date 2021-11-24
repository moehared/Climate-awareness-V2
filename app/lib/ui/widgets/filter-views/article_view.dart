import 'package:app/ui/widgets/user-post-stream-widget/user_post_stream_widget.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: Theme.of(context).scrollbarTheme,
      child: Scrollbar(
        child: UserPostStream(
          filterByArticle: true,
          filterByMedia: false,
        ),
      ),
    );
  }
}