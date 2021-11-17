import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/utilities-viewmodel.dart';
import 'package:flutter/material.dart';

class UtilitiesView extends StatelessWidget {
  const UtilitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UtilitiesViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'Utilies title',
                style: TextStyle(fontFamily: 'Roboto-'),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Title:ghsaghsaghsaghsgahghs',
                    textAlign: TextAlign.center,
                  ),
                  Text('slider'),
                  Text('button'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
