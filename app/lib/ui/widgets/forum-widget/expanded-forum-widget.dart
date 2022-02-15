import 'package:app/common/config.dart';
import 'package:app/common/styles/style.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/expanded-forum-viewmodel.dart';
import 'package:app/ui/widgets/user-forum-stream-widget/user-forum-comment-stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedForumWidget extends StatelessWidget {
  const ExpandedForumWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  final ExpandedForumViewModel model;

  //TODO: fix it
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.grey[200],
                    //backgroundImage: Image.asset('images/image.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${model.userForumModel.userDisplayName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text('Topic: ${model.userForumModel.topic}')
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${model.userForumModel.title}',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${model.userForumModel.description}',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(color: Colors.black),
              Row(
                children: [
                  IconButton(
                    onPressed: () => model.likeThePost(),
                    //model.likedPost(),
                    icon: model.isLikedPost()
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                          ),
                    iconSize: 30,
                  ),
                  Text(
                    "Like",
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    "${model.userForumModel.date}",
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //TODO add a button to filter comments 
           
        Container(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              // First child is enter comment text input
              Expanded(
                  child: Form(
                key: model.formkey,
                child: TextFormField(
                  controller: model.commentContoller,
                  decoration: new InputDecoration(
                    labelText: "Add a comment",
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent)),
                  ),
                  validator: (comment) {
                    if (comment!.isEmpty) {
                      return "Enter a comment";
                    }
                    model.blacklistCheck(comment);
                    if (model.blackListValidator) {
                      return "comment contains illicit words";
                    }
                  },
                  onSaved: (comment) {
                    model.setUserCommentModel =
                        model.userCommentModel.copyWith(userComment: comment);
                  },
                ),
              )),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.send),
                iconSize: 20.0,
                onPressed: model.submit,
              )
            ])),
        const SizedBox(
          height: 5,
        ),

        
        // UserCommentForumStream(
        //     fourmId: !model.userForumModel.forumId.isEmpty
        //         ? model.userForumModel.forumId
        //         : " "),
      ],
    );
  }
}
