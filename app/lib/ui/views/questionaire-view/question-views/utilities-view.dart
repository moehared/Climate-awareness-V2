import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/utilities-viewmodel.dart';
import 'package:app/ui/widgets/reusable-widget/reusable_question_card.dart';
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
            const SizedBox(height: 15),
            ReusableQuetionCard(
              label: model.sliderValue.toString(),
              defaultBtn: () {},
              onSliderChange: (value) => model.onSliderChange(value),
              value: model.sliderValue,
              questionTitle: 'This is where the question goes',
            ),
          ],
        ),
      ),
    );
  }
}
