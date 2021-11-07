import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:app/ui/widgets/text-widgets/forum_title_text.dart';


class ForumPostView extends StatelessWidget{
  const ForumPostView({Key? key}) : super(key: key);
@override
Widget build(BuildContext context){
  return BuildViewModel<ForumPostViewModel>(
     builder: (ctx, model, child) => Scaffold(
       body: BackgroundImage(backgroundImage: "images/space2.png",
       child: SafeArea(
         child: SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               



             ],
           ),
         ),
       ),
       )
     )
  );
  }
}