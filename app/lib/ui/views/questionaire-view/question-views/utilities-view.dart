import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/utilities-viewmodel.dart';
import 'package:app/ui/views/profile-view/profile-view.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';
import 'package:app/ui/widgets/form/text-field-widget.dart';
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
              model: model,
              prev: prev,
              next: next,
            )
          ],
        ),
      ),
    );
  }
}

class QuestionairesInput extends StatelessWidget {
  const QuestionairesInput({
    Key? key,
    required this.next,
    required this.prev,
    required this.model,
  }) : super(key: key);
  final Function() next;
  final Function() prev;
  final UtilitiesViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndHelpButton(
          label: 'Electricity',
          helpButton: () {},
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFieldWidget(
                controller: model.controller,
                hintText: '\$92/month',
              ),
            ),
            Expanded(
              child: FittedBox(
                child: DropDownMenuWidget(
                  onChanged: (item) {},
                  hintText: '\$',
                  items: ['\$', 'kWh'],
                  color: Colors.black,
                ),
              ),
            ),
            FittedBox(
              child: DropDownMenuWidget(
                onChanged: (item) {},
                hintText: "\/ mo",
                items: ['yr', 'mo'],
                color: Colors.black,
              ),
            ),
          ],
        ),
        TitleAndHelpButton(
          label: 'Heating Oil & Other Fuels',
          helpButton: () {},
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFieldWidget(
                controller: model.controller,
                hintText: '\$290 /month',
              ),
            ),
            Expanded(
              child: FittedBox(
                child: DropDownMenuWidget(
                  onChanged: (item) {},
                  hintText: '\$',
                  items: ['\$', 'gal'],
                  color: Colors.black,
                ),
              ),
            ),
            FittedBox(
              child: DropDownMenuWidget(
                onChanged: (item) {},
                hintText: "\/ mo",
                items: ['yr', 'mo'],
                color: Colors.black,
              ),
            ),
          ],
        ),
        TitleAndHelpButton(
          label: 'Natural Gas',
          helpButton: () {},
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFieldWidget(
                controller: model.controller,
                hintText: '\$480 /month',
              ),
            ),
            Expanded(
              child: FittedBox(
                child: DropDownMenuWidget(
                  onChanged: (item) {},
                  hintText: '\$',
                  items: ['\$', 'therms', 'ft³'],
                  color: Colors.black,
                ),
              ),
            ),
            FittedBox(
              child: DropDownMenuWidget(
                onChanged: (item) {},
                hintText: "\/ mo",
                items: ['yr', 'mo'],
                color: Colors.black,
              ),
            ),
          ],
        ),
        TitleAndHelpButton(
          label: 'Living space area',
          helpButton: () {},
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: model.controller,
                hintText: '\$1850 /ft²',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text('ft²'),
            ),
          ],
        ),
        TitleAndHelpButton(
          label: 'Water Usage',
          helpButton: () {},
        ),
        SliderWidget(
          value: 1,
          onChange: (val) {},
          step: 5,
          max: 5,
          label: '1-person household: 148 liters/day',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: prev,
                child: LabelTitleWidget(title: 'Previous'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: next,
                child: Text('Next'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
