import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/chat_viewmodel/chat_viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const routeName = '/ChatView';
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ChatViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Chat View'),
          actions: [
            IconButton(
              onPressed: model.fetchQuestionaires,
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: SafeArea(
            child: Center(child: Text('Chat View')),
          ),
        ),
      ),
    );
  }
}
