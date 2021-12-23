import 'package:app/common/styles/style.dart';
import 'package:app/common/utils/on_edit_complete.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/transportation-view/transportation-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/simple_or_advance_button.dart';

import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';
import 'package:app/ui/widgets/reusable-widget/nextor_prev_question_widget.dart';
import 'package:app/ui/widgets/reusable-widget/questionaire_input_widget.dart';
import 'package:app/ui/widgets/reusable-widget/row_with_textfield_and_child.dart';

import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
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
              child: LabelTitleWidget(title: 'HOW DO YOU GET AROUND?'),
            ),
            BuildTitleAndHelpButton(
              label: 'Add Vehicle if you drive.',
              rightIconButton: model.showVehicleUI,
              rightIconData: Icons.add,
              leftIconData: Icons.remove,
              leftIconButton: model.removeVehicleUI,
            ),
            ...List.generate(model.vehicleCount, (i) {
              final key = ValueKey(i);
              return QuestionairesInput(
                key: key,
                removelabelWidget: true,
                onBillTypeChanged: (type) => model.updateFuelDropdown(type, i),
                allowElevation: true,
                categoryLabel: 'Add Vehicle if you drive.',
                costTypeItems: ['Gasoline', 'Electric', 'Diesal'],
                costTypeValue: model.fuelTypeValues[i],
                // controller: model.vehicleController,
                occurrenceValue: model.unitTypeValues[i],
                onChanged: (item) {},
                units: ['Km', 'Mi'],
                leftIconData: Icons.remove,
                leftIconButton: model.removeVehicleUI,
                onAnnualDropdownChanged: (item) =>
                    model.updateUnitDropdown(item, i),
                textfieldHintlabel: '20,000 km/year',
                keyboardType: TextInputType.number,
                rightIconButton: () {},
                rightIconData: Icons.add,
                // onEditComplete: () => onEditComplete(
                //   ctx,
                //   model.publicFocusNode,
                // ),
                child: Column(
                  children: [
                    Card(
                      key: key,
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '${model.mpgValues[i].toStringAsFixed(0)} mpg',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    BuildSliderWidget(
                      value: model.mpgValues[i],
                      onChange: (val) {
                        model.updateMPGValue(val, i);
                      },
                      step: 115,
                      max: 115,
                      label: '${model.mpgValues[i].toStringAsFixed(0)}',
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 15),
            BuildSimpleOrAdvanceWidget(
              onAdvanceClick: model.onAdvance,
              onSimpleClick: model.onSimple,
              isSimple: model.showSimpleUI,
            ),
            const SizedBox(height: 15),
            //TODO: Refactor this widget. Make new widget and pass down neccesarry data
            //TODO: handle a way to show multiple different widget when user clicks on advance
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: kSimpleOrAdvanceContainerStyle,
              child: Column(
                children: [
                  BuildTitleAndHelpButton(
                    label: 'Public Transit',
                    rightIconButton: model.showPublicTransitHelpInfo,
                  ),
                  if (model.showSimpleUI)
                    RowWithTextFieldAndChild(
                      controller: model.publicController,
                      onChanged: (_) {},
                      focusNode: model.publicFocusNode,
                      child: DropDownMenuWidget(
                        items: ['KM', 'Mi'],
                        hintText: model.publicUnitValue,
                        color: Colors.black,
                        onChanged: (unit) =>
                            model.updatePublicUnitDropdownValue(unit),
                      ),
                      hintText: model.publicTransitHintText,
                    ),
                  if (!model.showSimpleUI)
                    ...List.generate(
                      model.publicTransitAdvanceList.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTitleWidget(
                              title:
                                  model.publicTransitAdvanceList[index].title),
                          RowWithTextFieldAndChild(
                            controller: model.publicTransitAdvanceList[index]
                                .textEditingController,
                            onChanged: (_) {},
                            focusNode:
                                model.publicTransitAdvanceList[index].focusNode,
                            child: DropDownMenuWidget(
                              items: ['Km', 'Mi'],
                              hintText: model.publicAdvanceUnitValue[index],
                              color: Colors.black,
                              onChanged: (unit) =>
                                  model.updatePublicAdvanceDropdownValues(
                                      unit, index),
                            ),
                            hintText:
                                model.publicTransitAdvanceList[index].hinText,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: kSimpleOrAdvanceContainerStyle,
              child: Column(
                children: [
                  BuildTitleAndHelpButton(
                    label: 'Air Travelling',
                    rightIconButton: model.showAirTransitHelpInfo,
                  ),
                  if (model.showSimpleUI)
                    RowWithTextFieldAndChild(
                      controller: model.airTravelController,
                      onChanged: (_) {},
                      focusNode: model.airTravelFocusNode,
                      child: DropDownMenuWidget(
                        items: ['KM', 'Mi'],
                        hintText: model.airTravelUnitDropdownValue,
                        color: Colors.black,
                        onChanged: (val) =>
                            model.updateAirTravelUnitDropdownValue(val),
                      ),
                      hintText: model.airTravelHintText,
                    ),
                  //TODO: handle Advance UI
                  if (!model.showSimpleUI)
                    ...List.generate(
                      model.airTravelAdvanceList.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTitleWidget(
                            title: model.airTravelAdvanceList[index].title,
                          ),
                          RowWithTextFieldAndChild(
                            controller: model.airTravelAdvanceList[index]
                                .textEditingController,
                            focusNode:
                                model.airTravelAdvanceList[index].focusNode,
                            child: DropDownMenuWidget(
                              items: ['Month', 'Year'],
                              hintText: model
                                  .airTravelAdvanceList[index].dropdownValue,
                              color: Colors.black,
                              onChanged: (val) =>
                                  model.updateAirAdvanceDropdown(val, index),
                            ),
                            hintText:
                                model.airTravelAdvanceList[index].hintText,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
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
