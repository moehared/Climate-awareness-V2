import 'package:app/domain/services/repository/post_firebase_repository.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/forum-post-widget/drop-down-widget.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app/common/utils/input_validator.dart';


class CreateForumPost extends StatelessWidget {
  CreateForumPost({
    required this.model,
    Key? key,
  }) : super(key: key);

 final  ForumPostViewModel model;

  @override
  Widget build(BuildContext context) {
 return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Form(
        key: model.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title",
                  style:Theme.of(context).textTheme.bodyText1,),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onFieldSubmitted: (_) {},
              validator: (titleName) {
                if (titleName!.isEmpty) {
                  return "Add a Title";
                }
                return null;
              },
              onSaved: (titleName) {
                model.setUserPostObj = model.userPostsModel.
                copyWith(title: titleName);
              },
            ),

            Text("Select a Catergory",
            style: TextStyle(fontSize: 20, color: Colors.white)
            ),
            DropDownMenuWidget(),

            Text("Description",
            
                  style: TextStyle(fontSize: 20, color: Colors.white,)
                  ),
            TextFormField(
              maxLines: null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onFieldSubmitted: (_) {},
              validator: (description) {
                if (description!.isEmpty) {
                  return "Add a Description";
                }
                return null;
              },
              onSaved: (description){
                model.setUserPostObj = model.userPostsModel.
                copyWith(description: description);
              },
            ),
            Text("URL",
                  style: TextStyle(fontSize: 20, color: Colors.white,),),
            TextFormField(
              maxLines: null,
              onFieldSubmitted: (_){},
              validator: (url){
                if(url!.isEmpty){
                  return "Add a article url";
                }
                else if(!url.isValidUrl())
                {
                  return "Enter a Valid URL in the form of https://wwww.Example.com";
                }
              },
              onSaved:(postUrl){
                model.setUserPostObj = model.userPostsModel.
                copyWith(url: postUrl);
              },
            ),
            ElevatedButton(onPressed: model.selectFile,
  
            child: const Text("Select image file")
            ),

            ElevatedButton(onPressed:(){},
            child: const Text("Upload image file")
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(onPressed:(){
                model.submit(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Posting")));
              }, child: const Text("Post")),
              )
          ],
      ),
      ),
    );
  }




}

