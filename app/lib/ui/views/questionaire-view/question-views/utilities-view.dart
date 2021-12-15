import 'package:app/common/styles/style.dart';
import 'package:app/common/utils/on_edit_complete.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/utilities-viewmodel.dart';

import 'package:app/ui/widgets/reusable-widget/nextor_prev_question_widget.dart';
import 'package:app/ui/widgets/reusable-widget/questionaire_input_widget.dart';
import 'package:app/ui/widgets/reusable-widget/row_with_textfield_and_child.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

class UtilitiesView extends StatelessWidget {
  const UtilitiesView({
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);
  final Function() next;
  final Function() prev;

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UtilitiesViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:
                  LabelTitleWidget(title: 'HOW MUCH DO YOU USE IN YOUR HOME?'),
            ),
            QuestionairesInput(
              categoryLabel: 'Electricity',
              costTypeItems: ['\$', 'kWh'],
              costTypeValue: '\$',
              controller: model.electrictyController,
              occurrenceValue: "/ mo",
              onChanged: (item) {},
              onPerMonthlyDropdownChanged: (item) {},
              textfieldHintlabel: '\$92/month',
              keyboardType: TextInputType.number,
              rightIconButton: () {},
              rightIconData: Icons.help,
              onEditComplete: () => onEditComplete(ctx, model.heatingFocusNode),
            ),
            QuestionairesInput(
              categoryLabel: 'Heating Oil & Other Fuels',
              costTypeItems: ['\$', 'gal'],
              costTypeValue: '\$',
              controller: model.heatingController,
              occurrenceValue: "/ mo",
              onChanged: (item) {},
              onPerMonthlyDropdownChanged: (item) {},
              textfieldHintlabel: '\$290/month',
              focusNode: model.heatingFocusNode,
              keyboardType: TextInputType.number,
              rightIconButton: () {},
              rightIconData: Icons.help,
              onEditComplete: () =>
                  onEditComplete(ctx, model.naturalGasFocusNode),
            ),
            QuestionairesInput(
              categoryLabel: 'Natural Gas',
              costTypeItems: ['\$', 'therms', 'ft³'],
              costTypeValue: '\$',
              controller: model.naturalGasController,
              occurrenceValue: "/ mo",
              onChanged: (item) {},
              onPerMonthlyDropdownChanged: (item) {},
              textfieldHintlabel: '\$480/month',
              focusNode: model.naturalGasFocusNode,
              keyboardType: TextInputType.number,
              rightIconButton: () {},
              onEditComplete: () =>
                  onEditComplete(ctx, model.livingSpaceFocusNode),
            ),
            BuildTitleAndHelpButton(
              label: 'Living space area',
              leftIconButton: null,
              rightIconButton: () {},
            ),
            RowWithTextFieldAndChild(
              hintText: '1850 /ft²',
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text('ft²'),
              ),
              controller: model.livingSpaceController,
              focusNode: model.livingSpaceFocusNode,
              onChanged: (item) {},
            ),
            BuildTitleAndHelpButton(
              label: 'Water Usage',
              leftIconButton: null,
              rightIconButton: () {},
            ),
            BuildSliderWidget(
              value: model.waterSliderValue,
              onChange: (val) => model.onWaterValueChange(val),
              step: 5,
              max: 5,
              label: model.waterValueLabel(model.waterSliderValue.toInt()),
            ),
            BuildNextOrPrevQuestionWidget(prev: prev, next: next)
          ],
        ),
      ),
    );
  }
}
