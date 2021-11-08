import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/community_viewmodel/community_viewmodel.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  static const routeName = '/CommunityView';
  const CommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building home view .......\n');
    return BuildViewModel<CommunityViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Community Post'),
          actions: [
            IconButton(onPressed: model.signOut, icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'count is ',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '${model.counter}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}