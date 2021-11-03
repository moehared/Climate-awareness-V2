import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/homeView_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/HomeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building home view .......\n');
    return BuildViewModel<HomeViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('capstone project tutorial'),
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
