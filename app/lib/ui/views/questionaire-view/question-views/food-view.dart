import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/food-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/simple_or_advance_button.dart';
import 'package:app/ui/widgets/reusable-widget/nextor_prev_question_widget.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';

import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

class FoodView extends StatelessWidget {
  const FoodView({
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);
  final Function() next;
  final Function() prev;

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<FoodViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: BuildTitleAndHelpButton(
                label:
                    'HOW MUCH DOES THE AVERAGE PERSON IN YOUR HOUSEHOLD EAT?',
                rightIconButton: model.showHelpText,
              ),
            ),
            const SizedBox(height: 20),
            BuildSimpleOrAdvanceWidget(
              onAdvanceClick: model.onAdvance,
              onSimpleClick: model.onSimple,
              isSimple: model.isSimple,
            ),
            const SizedBox(height: 20),
            LabelTitleWidget(
              title: model.isSimple
                  ? 'Meat, fish, eggs'
                  : 'Beef, pork, lamb, veal',
            ),
            BuildSliderWidget(
              value: model.isSimple
                  ? model.simpleMeatValue
                  : model.advanceMeatValue,
              onChange: model.onMeatChange,
              step: model.isSimple ? 9 : 8,
              max: model.isSimple ? 7.8 : 350 / 100,
              label:
                  '${model.isSimple ? model.simpleMeatValue.toStringAsFixed(1) : model.advanceMeatValue.toStringAsFixed(1)} daily servings per person',
            ),
            if (!model.isSimple)
              Column(
                children: [
                  LabelTitleWidget(
                    title: 'Fish & seafood',
                  ),
                  BuildSliderWidget(
                    value: model.seafoodAdvanceMeatValue,
                    onChange: (val) => model.updateSeafoodAdvanceMeatValue(val),
                    step: 8,
                    max: 11 / 10,
                    label:
                        ' ${model.seafoodAdvanceMeatValue.toStringAsFixed(1)}  daily servings per person',
                  ),
                  const SizedBox(height: 20),
                  LabelTitleWidget(
                    title:
                        'Other meat and meat alternatives (processed meat, nuts, etc.)',
                  ),
                  BuildSliderWidget(
                    value: model.otherMeat,
                    onChange: (val) => model.updateOtherMeat(val),
                    step: 6,
                    max: 9 / 10,
                    label: '${model.otherMeat} daily servings per person',
                  ),
                  const SizedBox(height: 20),
                  LabelTitleWidget(title: '  Poultry & eggs'),
                  BuildSliderWidget(
                    value: model.eggsAndPoultryValue,
                    onChange: (val) => model.updateEggsAndPoultryValue(val),
                    step: 7,
                    max: 24 / 10,
                    label:
                        '${model.eggsAndPoultryValue.toStringAsFixed(1)}  daily servings per person',
                  ),
                ],
              ),
            const SizedBox(height: 20),
            LabelTitleWidget(title: 'Grains & baked goods'),
            BuildSliderWidget(
              value: model.grainValue,
              onChange: (val) => model.updateGrainValue(val),
              step: 15,
              max: 134 / 10,
              label:
                  '${model.grainValue.toStringAsFixed(1)} daily servings per person',
            ),
            const SizedBox(height: 20),
            LabelTitleWidget(
              title: 'Dairy',
            ),
            BuildSliderWidget(
              value: model.dairyValue,
              onChange: (val) => model.updateDairyValue(val),
              step: 9,
              max: 7.2,
              label:
                  ' ${model.dairyValue.toStringAsFixed(1)} daily servings per person',
            ),
            const SizedBox(height: 20),
            LabelTitleWidget(title: 'Fruits and vegetables'),
            BuildSliderWidget(
              value: model.fruitAndVegetableValue,
              onChange: (val) => model.updateFruitsAndVegetableValue(val),
              step: 10,
              max: 116 / 10,
              label:
                  '${model.fruitAndVegetableValue.toStringAsFixed(1)} daily servings per person',
            ),
            LabelTitleWidget(title: 'Snacks, drinks, etc...'),
            BuildSliderWidget(
              value: model.snackAndDrinkValue,
              onChange: (val) => model.updateSnackAndDrinkValue(val),
              step: 12,
              max: 110 / 10,
              label:
                  '${model.snackAndDrinkValue.toStringAsFixed(1)} daily servings per person',
            ),
            BuildNextOrPrevQuestionWidget(
              prev: QuestionaireViewModel.previousQuestionScreen,
              next: model.next,
            )
          ],
        ),
      ),
    );
  }
}
