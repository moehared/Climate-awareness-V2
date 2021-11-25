import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/transportation-viewmodel.dart';
import 'package:flutter/material.dart';

class TransportationView extends StatelessWidget {
  const TransportationView({
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);
  final Function() next;
  final Function() prev;

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<TransportationViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'transportation title',
                style: TextStyle(fontFamily: 'Roboto-'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
