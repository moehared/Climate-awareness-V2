import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

import 'buildthree_children_row.dart';

class QuestionairesInput extends StatelessWidget {
  QuestionairesInput({
    Key? key,
    required this.categoryLabel,
    required this.controller,
    this.keyboardType,
    this.onEditComplete,
    required this.onChanged,
    required this.onPerMonthlyDropdownChanged,
    required this.costTypeValue,
    required this.costTypeItems,
    required this.occurrenceValue,
    required this.textfieldHintlabel,
    required this.rightIconButton,
    this.focusNode,
    this.rightIconData,
    this.units,
    this.leftIconButton,
    this.leftIconData,
    this.child,
    this.allowElevation = false,
  }) : super(key: key);
  final String categoryLabel;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function()? onEditComplete;
  final String costTypeValue;
  final String occurrenceValue;
  final String textfieldHintlabel;
  final Function(String?)? onChanged;
  final Function(String?)? onPerMonthlyDropdownChanged;
  final List<String> costTypeItems;
  final FocusNode? focusNode;
  final Function() rightIconButton;
  final Function()? leftIconButton;
  final IconData? rightIconData;
  final IconData? leftIconData;
  final List<String>? units;
  final Widget? child;
  final bool allowElevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: allowElevation ? 4 : 0,
      child: Column(
        children: [
          BuildTitleAndHelpButton(
            label: categoryLabel,
            rightIconData: rightIconData,
            rightIconButton: rightIconButton,
            leftIconButton: leftIconButton,
            leftIconData: leftIconData,
          ),
          const SizedBox(height: 10),
          BuildThreeChildrenRowWidget(
            controller: controller,
            focusNode: focusNode,
            units: units,
            keyboardType: keyboardType,
            billTypeValue: costTypeValue,
            billTypeItems: costTypeItems,
            onChanged: (item) {},
            monthlyValue: occurrenceValue,
            textfieldHintlabel: textfieldHintlabel,
            onPerMonthlyDropdownChanged: (item) {},
            onEditComplete: onEditComplete,
          ),
          // const SizedBox(height: 20),
          if (child != null)
            Column(
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
                child!
              ],
            )
        ],
      ),
    );
  }
}
