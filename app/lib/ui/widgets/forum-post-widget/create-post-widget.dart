import 'package:app/domain/services/repository/post_firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/forum-post-widget/drop-down-widget.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';


class CreateForumPost extends StatefulWidget {
  const CreateForumPost({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ForumPostViewModel model;
  @override
  State<CreateForumPost> createState() =>
      _CreatePostForumState();
}


class _CreatePostForumState extends State<CreateForumPost> with SingleTickerProviderStateMixin { 
  File ? file;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

      child: Form(
        key: widget.model.formkey,
        child: Column(
          children: [
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
            ),
            Text("Select a Catergory"),
            DropDownMenuWidget(),

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
            ),
            TextFormField(
              maxLines: null,
              onFieldSubmitted: (_){},
              validator: (url){
                if(url!.isEmpty){
                  return "Add a URL";
                }
              },
            ),
            ElevatedButton(onPressed: (){
              selectFile();
            },
            child: const Text("Select image file")
            ),


            ElevatedButton(onPressed:(){},
            child: const Text("Upload image file")
            ),
          ],
      ),
      )
    );
  }


// move to viewmodel 
  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result == null)return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }

  Future uploadFile() async{
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'Path To firebase/$fileName';
    
    //Create function to upload to firebase 
  }


}

