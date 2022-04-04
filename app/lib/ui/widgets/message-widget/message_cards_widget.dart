import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCards extends StatelessWidget{
  final MessageModel messageModel; 
 const  MessageCards({
    required this.messageModel
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: locator<AuthService>().currentUser.get()!.uid == messageModel.sender.userId ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding:  EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          constraints: BoxConstraints(maxWidth:120 ),
          decoration: BoxDecoration(
            color: locator<AuthService>().currentUser.get()!.uid == messageModel.sender.userId ? Colors.grey[100]  : Colors.blue,
            borderRadius: locator<AuthService>().currentUser.get()!.uid ==
                  messageModel.sender.userId ? BorderRadius.circular(10) : BorderRadius.circular(10) 
          ),
          child: Column(
            crossAxisAlignment: locator<AuthService>().currentUser.get()!.uid == messageModel.sender.userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text("${messageModel.message}",
              style: TextStyle(color: locator<AuthService>().currentUser.get()!.uid == messageModel.sender.userId ? Colors.black : Colors.white),
              textAlign: locator<AuthService>().currentUser.get()!.uid == messageModel.sender.userId ? TextAlign.end : TextAlign.start,
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${messageModel.timeStamp}",
                  style: TextStyle(fontSize: 7),
                  )
                ],
              )
            ],
          ) ,
        )
   
      ],

    );
  }

}
