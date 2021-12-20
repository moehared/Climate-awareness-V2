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
            QuestionairesInput(
              onBillTypeChanged: (type) {},
              allowElevation: true,
              categoryLabel: 'Add Vehicle if you drive.',
              costTypeItems: ['Gasoline', 'Electric', 'Diesal'],
              costTypeValue: 'Gasoline',
              controller: model.vehicleController,
              occurrenceValue: "Km",
              onChanged: (item) {},
              units: ['Km', 'Mi'],
              leftIconData: Icons.remove,
              leftIconButton: () {},
              onAnnualDropdownChanged: (item) {},
              textfieldHintlabel: '20,000 km/year',
              keyboardType: TextInputType.number,
              rightIconButton: () {},
              rightIconData: Icons.add,
              onEditComplete: () => onEditComplete(ctx, model.publicFocusNode),
              child: Column(
                children: [
                  Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        '20 mpg',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  BuildSliderWidget(
                    value: 0,
                    onChange: (val) {},
                    step: 4,
                    max: 30,
                    label: '2',
                  ),
                ],
              ),
            ),
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
                    rightIconButton: () {},
                  ),
                  if (model.showSimpleUI)
                    RowWithTextFieldAndChild(
                      controller: model.publicController,
                      onChanged: (_) {},
                      focusNode: model.publicFocusNode,
                      child: DropDownMenuWidget(
                        items: ['KM', 'Mi'],
                        hintText: 'KM',
                        color: Colors.black,
                        onChanged: (_) {},
                      ),
                      hintText: '600 km/year',
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
                              items: ['KM', 'Mi'],
                              hintText: 'KM',
                              color: Colors.black,
                              onChanged: (_) {},
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
                    rightIconButton: () {},
                  ),
                  if (model.showSimpleUI)
                    RowWithTextFieldAndChild(
                      controller: model.airTravelController,
                      onChanged: (_) {},
                      focusNode: model.airTravelFocusNode,
                      child: DropDownMenuWidget(
                        items: ['KM', 'Mi'],
                        hintText: 'KM',
                        color: Colors.black,
                        onChanged: (_) {},
                      ),
                      hintText: '5000 km/year',
                    ),
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
                            onChanged: (_) {},
                            focusNode:
                                model.airTravelAdvanceList[index].focusNode,
                            child: DropDownMenuWidget(
                              items: ['Month', 'Year'],
                              hintText: model
                                  .airTravelAdvanceList[index].dropdownValue,
                              color: Colors.black,
                              onChanged: (val) {
                                model.airTravelAdvanceList[index]
                                    .dropdownValue = 'Flight/$val';

                                print('value is $val');
                              },
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
