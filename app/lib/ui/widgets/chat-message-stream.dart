// import 'package:app/domain/models/message_model.dart';
// import 'package:app/domain/services/locator.dart';
// import 'package:app/ui/widgets/chat-message-cards.dart';
// import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
// import 'package:app/ui/widgets/loading_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class ChatMessageStream extends StatelessWidget{
//   final chatRoomId;

//   const ChatMessageStream({
//     required this.chatRoomId
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot<Map<String, Object?>>>(
//       stream: firestore
//       .collection("messages")
//       .where("chatId", isEqualTo: chatRoomId)
//       .snapshots(),
//       builder: (ctx,snapshot){
//           if (!snapshot.hasData) {
//             return ErrorTextWidget(errorMsg: 'No Data exists');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: Loading());
//           }
//           final messages = snapshot.data!.docs;

//           List<Widget> cardWidget = messages.map<Widget>((e) {
//             final messageData = MessageModel.fromMap(e.data());

//             return ChatMessageCards(
              
            
//             );
//           }).toList();

//         return 
//       })
//   }

// }