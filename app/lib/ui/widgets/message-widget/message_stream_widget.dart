
import 'package:app/domain/models/message_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:app/ui/widgets/message-widget/message_cards_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../loading_widget.dart';

class MessageStream extends StatelessWidget{
  final String chatId;
  const MessageStream({
    required this.chatId
  });

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
      stream:  firestore
     .collection("messages")
     .doc(chatId)
     .collection("userMessages")
     //SOME HOW ACCESS MAP VALUE OF USER ID DONT KNOW What to do here.,........ D:
     
     //.where("sender.userId",isEqualTo: locator<AuthService>().currentUser.get()!.uid)
     .orderBy("timeStamp", descending: false)
     .snapshots(),
     builder: (ctx, snapshot){
           if (!snapshot.hasData) {
            return ErrorTextWidget(errorMsg: 'No Data exists');
          }
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading());
          }

          final messages = snapshot.data!.docs;
           List<Widget> cardWidget = messages.map<Widget>((e) {
            final userData = MessageModel.fromMap(e.data());

            return MessageCards(
              messageModel: userData,
            );
          }).toList();


          
          if (cardWidget.isEmpty) {
            return ErrorTextWidget(
              errorMsg: 'No Messages.',
            );
          }

          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );


     });
    
  }


}