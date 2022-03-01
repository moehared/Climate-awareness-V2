import 'package:app/domain/services/database_services/chat_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user_chat_viewmodel/user_chat_viewmodel.dart';
import 'package:app/ui/widgets/message-widget/message_stream_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MessageView extends StatelessWidget{
  static const routeName = '/MessageView';
  final chatId;
   const MessageView({
     this.chatId ,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("This is messageView ${chatId}");
    return BuildViewModel<UserChatViewModel>(
      onModelReady: (model) => model.initState(chatId:  chatId),
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          //automaticallyImplyLeading: false,
          elevation: 0,
          title:  Text('${model.getUserName()}'),
        ),
        body: Container(
          //backgroundImage: 'images/space2.png',
          child: 
          Column(
            children: [
              
              Expanded(child:
               ListView
              (
                
                  children: [
                      MessageStream(chatId: chatId)
                  ],
               
              )
            ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(width: 5,),
                
                    Expanded(
                      child: Form(
                        key: model.formkey,
                        child: TextFormField(
                          controller: model.getMessageController,
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: true,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            labelText: "Type your message",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0),
                              gapPadding:  8,
                              borderRadius: BorderRadius.circular(25)
                            )
                          ),
                          validator: (messageInput){
                            if(messageInput!.isEmpty){
                              return "Cannot send a empty message";
                            }
                          },
                          onSaved: (messageInput) {
                            print("this is the typed message : ${messageInput}");
                            print("this is the chat ID : ${chatId}");
                            model.setMessageModel = model.messageModel.copyWith(message: messageInput, chatId: chatId);
                          } ,
                        ),
                      ) 
                      ),
                      const SizedBox(width: 15,),
                      GestureDetector(
                        onTap: model.submitMessage,
                        child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                        ),
                        child: Icon(Icons.send,color: Colors.white,), 
                           
                        ),
                       
                      ),
                       const SizedBox(width: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}