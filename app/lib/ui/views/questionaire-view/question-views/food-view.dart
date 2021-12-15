import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/food-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/simple_or_advance_button.dart';
import 'package:app/ui/widgets/reusable-widget/nextor_prev_question_widget.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/spacing_widget/verticle_space.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: BuildTitleAndHelpButton(
                label:
                    'HOW MUCH DOES THE AVERAGE PERSON IN YOUR HOUSEHOLD EAT?',
                rightIconButton: () {},
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
              value: model.onMeatValue,
              onChange: model.onMeatChange,
              step: 3,
              max: model.isSimple ? 7.8 : 360,
              label:
                  '${model.onMeatValue.toStringAsFixed(1)} daily servings per person',
            ),
            if (!model.isSimple)
              Column(
                children: [
                  LabelTitleWidget(
                    title: 'Fish & seafood',
                  ),
                  BuildSliderWidget(
                    value: 2.6,
                    onChange: (val) {},
                    step: 3,
                    max: 120,
                    label:
                        ' ${model.seaFoodValue.toStringAsFixed(1)}  daily servings per person',
                  ),
                  const SizedBox(height: 20),
                  LabelTitleWidget(
                    title:
                        'Other meat and meat alternatives (processed meat, nuts, etc.)',
                  ),
                  BuildSliderWidget(
                    value: 2.6,
                    onChange: (val) {},
                    step: 3,
                    max: 9,
                    label: '${model.otherMeat} daily servings per person',
                  ),
                  const SizedBox(height: 20),
                  LabelTitleWidget(title: '  Poultry & eggs'),
                  BuildSliderWidget(
                    value: 80,
                    onChange: (val) {},
                    step: 3,
                    max: 240,
                    label: '0.3 daily servings per person',
                  ),
                ],
              ),
            const SizedBox(height: 20),
            LabelTitleWidget(title: 'Grains & baked goods'),
            BuildSliderWidget(
              value: 2.6,
              onChange: (val) {},
              step: 3,
              max: 7.8,
              label: ' daily servings per person',
            ),
            const SizedBox(height: 20),
            LabelTitleWidget(
              title: 'Dairy',
            ),
            BuildSliderWidget(
              value: 2.6,
              onChange: (val) {},
              step: 3,
              max: 7.8,
              label: '2.6 daily servings per person',
            ),
            const SizedBox(height: 20),
            LabelTitleWidget(title: 'Fruits and vegetables'),
            BuildSliderWidget(
              value: 2.6,
              onChange: (val) {},
              step: 3,
              max: 7.8,
              label: '2.6 daily servings per person',
            ),
            LabelTitleWidget(title: 'Snacks, drinks, etc...'),
            BuildSliderWidget(
              value: 2.6,
              onChange: (val) {},
              step: 3,
              max: 7.8,
              label: '2.6 daily servings per person',
            ),
            BuildNextOrPrevQuestionWidget(
              prev: QuestionaireViewModel.previousQuestionScreen,
              next: QuestionaireViewModel.nextQuestionScreen,
            )
          ],
        ),
      ),
    );
  }
}
