import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class QuestionaireView extends StatelessWidget {
  static const routeName = '/QuestionaireView';
  const QuestionaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<QuestionaireViewModel>(
      builder: (ctx, model, child) => Scaffold(
        key: model.scaffold,
        appBar: AppBar(
          title: Text('Questionnaires'),
          leading: model.selectedPage == 0
              ? null
              : IconButton(
                  icon: (Icon(Icons.arrow_back)),
                  onPressed: model.previousQuestionScreen,
                ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: model.pageController,
                onPageChanged: (i) {
                  model.setSelectedPageIndex = i;
                  model.setProgressAnim(i);
                },
                children: [
                  ...model.pages,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Visibility(
                visible: model.selectedPage != 0,
                child: FAProgressBar(
                  maxValue: model.totalPages,
                  currentValue: model.growthStep.toInt(),
                  progressColor: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Visibility(
          visible: model.selectedPage == 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.padded,
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {},
                  child: Text('Calculate Carbon'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.padded,
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    model.nextQuestionScreen();
                  },
                  child: Text('Refine Your Estimate'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
