import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/chat-view/message-view.dart';
import 'package:app/ui/widgets/avator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/date_format.dart';

class RecentChatCards extends StatefulWidget {
  final ChatModel chatModel;

  RecentChatCards({
    required this.chatModel,
  });

  @override
  State<RecentChatCards> createState() => _RecentChatCardsState();
}

class _RecentChatCardsState extends State<RecentChatCards> {
  var msg = '';
  var date = "";
  var person = "";
  void goToChatView() {
    final navigationServices = locator<NavigationService>();
    navigationServices.navigateTo(MessageView.routeName,
        argument: widget.chatModel.chatId);
  }

  @override
  void initState() {
    print('init ....');
    super.initState();
    //  getCurrentMsg();

    final msgData = locator<ChatDatabaseService>()
        .getRecentChatMessage(widget.chatModel.chatId)
        .then((value) {
      print('value nessage inside init state ${value.message}');
      setState(() {
        date = recentChatDateFormat(value.timeStamp);
        msg = value.message;
        person = value.sender.firstName + " " + value.sender.lastName;
        print('msg is $msg');
      });
    });
    setState(() {});
  }

  // Future<MessageModel> getRecentMessage() async {
  Future<void> getCurrentMsg() async {
    final msgData = await locator<ChatDatabaseService>()
        .getRecentChatMessage(widget.chatModel.chatId);

    print('message data $msgData');
    msg = msgData.message;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    //print("This is recent messages ${getRecentMessage()}");
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 20,
        )
      ]),
      //This is for the background]

      GestureDetector(
        onTap: () => goToChatView(),
        child: Container(
          //height: media.height * 0.10,
          width: double.infinity,
          //margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        UserAvatar(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(locator<AuthService>()
                                        .currentUser
                                        .get()!
                                        .uid ==
                                    widget.chatModel.reciever.userId
                                ? "${widget.chatModel.sender.firstName} ${widget.chatModel.sender.lastName}"
                                : "${widget.chatModel.reciever.firstName} ${widget.chatModel.reciever.lastName}"),
                            const SizedBox(
                              height: 2,
                            ),
                            
                          ],
                        )
                      ],
                    ),
                    
                  ]
                ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text( msg.isNotEmpty ?"${person}" + ": " +
                            msg : "",
                            style: TextStyle(color: Colors.grey[350], fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            
                          )
                          )),
                  Padding(
                    padding: const EdgeInsets.only(
                      // top: 15.0,
                      right: 15,
                    ),
                    child: Text("${date}", style:
                            TextStyle(color: Colors.grey[350], fontSize: 12)),
                  ),
                ],
              ),

              // show current time message is read or seen
            ],
            //),
            //],
          ),
        ),
      ),
    ]);
  }
}
