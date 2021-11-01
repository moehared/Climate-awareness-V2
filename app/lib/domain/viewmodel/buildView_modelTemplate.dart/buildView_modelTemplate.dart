// ignore_for_file: file_names

import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/domain/services/locator.dart';


// inspired by stack architecture package created by filled stack .
// https://pub.dev/packages/stacked

class BuildViewModel<T extends BaseViewModel> extends StatefulWidget {
  const BuildViewModel({
    Key? key,
    required this.builder,
    this.onModelReady,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  @override
  _BuildViewModelState<T> createState() => _BuildViewModelState<T>();
}

class _BuildViewModelState<T extends BaseViewModel>
    extends State<BuildViewModel<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

class BuildTest<T extends BaseViewModel> extends StatefulWidget {
  const BuildTest({Key? key}) : super(key: key);

  @override
  _BuildTestState<T> createState() => _BuildTestState<T>();
}

class _BuildTestState<T extends BaseViewModel> extends State<BuildTest<T>> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
