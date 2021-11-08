import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/filter-viewmodels/articles_viewmodel.dart';
import 'package:app/ui/widgets/user-post-stream-widget/user_post_stream_widget.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ArticleViewModel>(builder: (ctx,model,child) =>  Column(
              children: [
                UserPostStream(
                  filterByArticle: true,
                  filterByMedia: false,
                ),
              ],
            ),);
  }
}