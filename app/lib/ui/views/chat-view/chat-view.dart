import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/chat_viewmodel/chat_viewmodel.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const routeName = '/ChatView';
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ChatViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Chat View'),
        ),
        body: SafeArea(
          child: Center(child: Text('Chat View')),
        ),
      ),
    );
  }
}
