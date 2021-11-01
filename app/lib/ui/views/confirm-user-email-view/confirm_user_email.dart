import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/confirm_user_email_viewmodel/confirm_user_email_viewmodel.dart';
import 'package:flutter/material.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ConfirmUserEmailViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Confirm Email'),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
