import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user_chat_viewmodel/user_chat_viewmodel.dart';
import 'package:app/ui/widgets/chat-widget/recent_chat_stream.dart';
import 'package:app/ui/widgets/search-bar-widget.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const routeName = '/ChatView';
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UserChatViewModel>(
        onModelReady: (model) => model.initState(),
        builder: (ctx, model, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              //automaticallyImplyLeading: false,
              elevation: 0,
              title: Text('Chat'),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.white,
                ),
                Positioned(
                  top: 60,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Text("Recent Chats"),
                          Positioned(
                               //top: 90,
                              // bottom: 0,
                              // right: 0,
                              // left: 0,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: Container(
                                    child: RecentChatStream(
                                        userId: model.getUserId),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
                SearchPage(
                    onChanged: (searchKey) async {
                      var aData =
                          await model.getFilteredUsersBySearchKey(searchKey!);
                      // .then((value) =>
                      //     value.map((e) => e.toJson()).toList());
                      print("this is aData ${aData}");
                      model.setSomeData = aData;
                      return aData;
                    },
                    hint: model.getSearchHint,
                    errorMessage: model.getErrorMessage,
                    searchController: model.getSearchTextController),
              ],
            )));
  }
}
