import 'package:flutter/cupertino.dart';
import 'package:app/common/enums/view_state.dart';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';



class CreateForumPost extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20
      ),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            onFieldSubmitted: (_){},
            validator: (titleName){
              if(titleName!.isEmpty){
                return "Add a Title";
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: null,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            onFieldSubmitted: (_){},
            validator: (description){
              if(description!.isEmpty){
                return "Add a Description";
              }
              return null;
            },
          ),
          
          



        ],
      )
      







      );
  }

}
