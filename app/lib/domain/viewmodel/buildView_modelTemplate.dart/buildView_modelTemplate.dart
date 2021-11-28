// ignore_for_file: file_names

import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/domain/services/locator.dart';

// inspired by stack architecture package created by filled stack .
// https://pub.dev/packages/stacked

class BuildViewModel<T extends BaseViewModel> extends StatefulWidget {
  BuildViewModel({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.child,
  }) : super(key: key);

  /// [builder] is must that must be used when creating views
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  /// call [onModelReady] when you to initial or fetch data before initializing the views
  final Function(T)? onModelReady;

  /// use this child which is any widget when you want to avoid unneccery rebuilds
  final Widget? child;

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
        child: widget.child,
      ),
    );
  }
}
