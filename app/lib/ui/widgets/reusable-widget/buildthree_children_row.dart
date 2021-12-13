import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';
import 'package:app/ui/widgets/form/text-field-widget.dart';
import 'package:flutter/material.dart';

class BuildThreeChildrenRowWidget<T extends BaseViewModel>
    extends StatelessWidget {
  const BuildThreeChildrenRowWidget({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.onEditComplete,
    required this.onChanged,
    required this.onPerMonthlyDropdownChanged,
    required this.billTypeValue,
    required this.billTypeItems,
    required this.monthlyValue,
    required this.textfieldHintlabel,
    this.units,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function()? onEditComplete;
  final String billTypeValue;
  final String monthlyValue;
  final String textfieldHintlabel;
  final Function(String?)? onChanged;
  final Function(String?)? onPerMonthlyDropdownChanged;
  final List<String> billTypeItems;
  final FocusNode? focusNode;
  final List<String>? units;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFieldWidget(
            onChanged: (_) {},
            focusNode: focusNode,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            controller: controller,
            onEditComplete: onEditComplete,
            hintText: textfieldHintlabel,
          ),
        ),
        Expanded(
          child: FittedBox(
            child: DropDownMenuWidget(
              onChanged: onChanged,
              hintText: billTypeValue,
              items: billTypeItems,
              color: Colors.black, // can be refactor in the future
              //TODO: Refactor colors and background if neccessary
            ),
          ),
        ),
        FittedBox(
          child: DropDownMenuWidget(
            onChanged: onPerMonthlyDropdownChanged,
            hintText: monthlyValue,
            items: units == null
                ? ['yr', 'mo']
                : units, // can be changed in the future to handle bi-weekly
            // but for now , we can leave as it is
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
