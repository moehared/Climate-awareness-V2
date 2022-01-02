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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UtilitiesViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:
                  LabelTitleWidget(title: 'HOW MUCH DO YOU USE IN YOUR HOME?'),
            ),
            QuestionairesInput(
              categoryLabel: model.electricty,
              costTypeItems: ['\$', 'kWh'],
              helperText: model.electrictyHelperText,
              onChanged: (input) => model.onElectrictyInputChanged(input),
              onBillTypeChanged: (type) => model.onBillTypeChange(type),
              costTypeValue: model.electrictyCostValue,
              controller: model.electrictyController,
              occurrenceValue: model.electrictyOccurenceValue,
              onAnnualDropdownChanged: (item) =>
                  model.setAnnualElectricCityDropdown(item),
              textfieldHintlabel: model.electrictyHintText,
              keyboardType: TextInputType.number,
              
              rightIconButton: model.showElectrictyInfo,
              rightIconData: Icons.help,
              onEditComplete: () => onEditComplete(ctx, model.heatingFocusNode),
            ),
            QuestionairesInput(
              onBillTypeChanged: (type) => model.onHeatingDropdownChanged(type),
              categoryLabel: model.heatingAndOthers,
              costTypeItems: ['\$', 'gal'],
              onChanged: (input) => model.onHeatingInputTextChanged(input),
              helperText: model.heatingHelperText,
              costTypeValue: model.heatingDropdownValue,
              controller: model.heatingController,
              occurrenceValue: model.heatingAnnuallyValue,
              onAnnualDropdownChanged: (item) =>
                  model.onAnnualDropdownValue(item),
              textfieldHintlabel: model.heatingHintText,
              focusNode: model.heatingFocusNode,
              keyboardType: TextInputType.number,
              rightIconButton: model.showHeatingInfo,
              rightIconData: Icons.help,
              onEditComplete: () =>
                  onEditComplete(ctx, model.naturalGasFocusNode),
            ),
            QuestionairesInput(
              onBillTypeChanged: (type) =>
                  model.onNaturalGasCostUnitChange(type),
              helperText: model.naturalHelperText,
              categoryLabel: model.naturalGas,
              costTypeItems: ['\$', 'therms', 'ft³'],
              costTypeValue: model.naturalGasUnitCostValue,
              controller: model.naturalGasController,
              occurrenceValue: model.naturalGasAnnualValue,
              onChanged: (item) => model.onNaturalInputChanged(item),
              onAnnualDropdownChanged: (item) =>
                  model.onNaturalGasAnnualChange(item),
              textfieldHintlabel: model.naturalGasHintText,
              focusNode: model.naturalGasFocusNode,
              keyboardType: TextInputType.number,
              rightIconButton: model.showNaturalHelpInfo,
              rightIconData: Icons.help,
              onEditComplete: () =>
                  onEditComplete(ctx, model.livingSpaceFocusNode),
            ),
            BuildTitleAndHelpButton(
              label: model.livingSpace,
              rightIconButton: model.showLivingSpaceInfo,
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
              onChanged: (input) => model.onLivingSpaceAreaInputChanged(input),
            ),
            SizedBox(height: 10),
            LabelTitleWidget(title: model.livingSpaceAreaHelperText),
            SizedBox(height: 15),
            BuildTitleAndHelpButton(
              label: model.waterUsage,
              rightIconButton: model.showWaterHelpInfo,
            ),
            BuildSliderWidget(
              value: model.waterSliderValue,
              onChange: (val) => model.onWaterValueChange(val),
              step: 5,
              max: 5,
              label: model.waterValueLabel(model.waterSliderValue.toInt()),
            ),
            BuildNextOrPrevQuestionWidget(
              prev: () {},
              next: model.next,
              hidePrevBtn: true,
              // disabled: !model.isValid,
            ),
          ],
        ),
      ),
    );
  }
}
