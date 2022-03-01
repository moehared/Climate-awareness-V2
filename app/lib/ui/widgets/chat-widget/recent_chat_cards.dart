import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/chat-view/message-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentChatCards extends StatelessWidget{
  final ChatModel chatModel;
  const RecentChatCards({
    required this.chatModel
  });


  void goToChatView(){
    final navigationServices = locator<NavigationService>();
    navigationServices.navigateTo(MessageView.routeName, argument: chatModel.chatId);
  }
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //TODO: Add profile picture
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 15,
        )
        //   TextButton(
        //     style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
        //     onPressed: () => showPopUpMenu(
        //         child: ShowEditForumPopUpMenu(
        //           forumId: forum.forumId,
        //           userID: forum.userId,
        //         ),
        //         context: context),
        //     child: Text(
        //       'Edit Forum Post',
        //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //             backgroundColor: Colors.pink,
        //           ),
        //     ),
        //   ),
      ]),
      //This is for the background]
      GestureDetector(
        onTap: () => goToChatView(),
        child: Container(
          height: media.height * 0.10,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
         // margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  // CircleAvatar(
                  //   radius: 20.0,
                  //   // backgroundColor: image == null ? Colors.grey[200] : null,
                  //   backgroundImage: image != null
                  //       ? FileImage(image!) as ImageProvider
                  //       : null,
                  // ),
                  const SizedBox(
                    width: 2,
                  ),
                  Column(
                    children: [
                      Text( locator<AuthService>().currentUser.get()!.uid == chatModel.reciever.userId ? 
                        "${chatModel.sender.firstName} ${chatModel.sender.lastName}" : "${chatModel.reciever.firstName} ${chatModel.reciever.lastName}"),
                    ],
                  ),
                  const SizedBox(
                    width: 150.0,
                  ),
                  // IconButton(
                  //     onPressed: () => showPopUpMenu(
                  //         child: ShowEditForumPopUpMenu(
                  //           forumId: forum.forumId,
                  //           userID: forum.userId,
                  //         ),
                  //         context: context),
                  //     icon: const Icon(Icons.more_horiz)
                  //     )
                ],
              ),
 
            ],
          ),
        ),
      ),
    ]);
  }
  

}