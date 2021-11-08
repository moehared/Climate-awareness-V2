import 'package:app/ui/views/forum-view/forum-posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:flutter/material.dart';
class DropDownMenuWidget extends StatefulWidget{
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDownMenuWidget>{
  String chosenValue = "Select";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
     items: [  ],
    );
  }
}
