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
      onModelReady: (model) =>  model.initState(),
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          //automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Chat View'),
          actions: [
            IconButton(
              onPressed: () => model.createChatRoom("", ""),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Stack(
          //backgroundImage: 'images/space2.png',
          fit: StackFit.expand,
                children: [
                  SearchPage(
                      onChanged: (searchKey) async {
                        //TODO fix this thing
                        var aData = await model
                            .getFilteredUsersBySearchKey(searchKey!)
                            .then((value) =>
                                value.map((e) => e.firstName).toList());
                        print("this is aData ${aData}");
                        model.setSomeData = aData;
                        return aData;
                      },
                      hint: model.getSearchHint,
                      errorMessage: model.getErrorMessage,
                      searchController: model.getSearchTextController),
                      
                ],
              ),
              
            ),
            
        
        );
  }
}
