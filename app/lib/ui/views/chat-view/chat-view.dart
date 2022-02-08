import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user_chat_viewmodel/user_chat_viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/search-bar-widget.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const routeName = '/ChatView';
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UserChatViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Chat View'),
          actions: [
            IconButton(
              onPressed: () => model.createChatRoom("", ""),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: SafeArea(
            child: Scaffold(
              body: SearchPage(
                onChanged: (searchKey) {
                  model.getData(searchKey!);
                },
                hint: model.getSearchHint,
                errorMessage: model.getErrorMessage,
                searchController: model.getSearchTextController,
              ),
            ),
          //     child: Column(
          //   children: [
          //     const SizedBox(
          //       height: 5,
          //     ),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     //RecentChats()
          //   ],
          // )
              // Center(child: Text('Chat View')),
              ),
        ),
      ),
    );
  }
}
