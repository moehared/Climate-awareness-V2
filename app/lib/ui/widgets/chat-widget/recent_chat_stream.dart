import 'package:app/domain/models/chat_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/chat-widget/recent_chat_cards.dart';
import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import '../loading_widget.dart';

class RecentChatStream extends StatelessWidget {
  final String userId;
  const RecentChatStream({required this.userId});
//cant do conditional OR statement so
//TODO FIX this logic some how we need to filter everything out from using userId: Thought process of using a fork Stream to combine two streams and  then filter out for duplicats

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
        stream: firestore
            .collection("userChat")
            .where("arrayOfUserAndReciever", arrayContains: userId)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return ErrorTextWidget(errorMsg: 'No Data exists');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading());
          }

          final recentChats = snapshot.data!.docs;
          List<Widget> cardWidget = recentChats.map<Widget>((e) {
            final userData = ChatModel.fromMap(e.data());
          String? msg;
         
            return RecentChatCards(
              chatModel: userData,
        
            );
          }).toList();

          if (cardWidget.isEmpty) {
            return ErrorTextWidget(
              errorMsg: 'No Chats.',
            );
          }

          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentChats.length,
            itemBuilder: (_, index) {
              return cardWidget[index];
            },
          );
        });
  }
}
