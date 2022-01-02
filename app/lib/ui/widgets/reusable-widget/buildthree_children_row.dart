import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';
import 'package:app/ui/widgets/form/text-field-widget.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:flutter/material.dart';

class BuildThreeChildrenRowWidget<T extends BaseViewModel>
    extends StatelessWidget {
  const BuildThreeChildrenRowWidget({
    Key? key,
    this.controller,
    this.keyboardType,
    this.onEditComplete,
    required this.onTextChanged,
    required this.onAnnuallyDropdownChanged,
    required this.billTypeValue,
    required this.billTypeItems,
    required this.monthlyValue,
    required this.textfieldHintlabel,
    required this.onBillTypeChange,
    this.units,
    this.helperText,
    this.focusNode,
    this.disableDropdownButton = false,
  }) : super(key: key);
  final bool disableDropdownButton;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function()? onEditComplete;
  final String billTypeValue;
  final String monthlyValue;
  final String textfieldHintlabel;
  final Function(String?)? onTextChanged;
  final Function(String?)? onBillTypeChange;
  final Function(String?)? onAnnuallyDropdownChanged;
  final List<String> billTypeItems;
  final FocusNode? focusNode;
  final List<String>? units;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  onChanged: onTextChanged,
                  focusNode: focusNode,
                  helperText: helperText,
                  textInputAction: TextInputAction.next,
                  keyboardType: keyboardType,
                  controller: controller,
                  onEditComplete: onEditComplete,
                  hintText: textfieldHintlabel,
                ),
              ),
              DropDownMenuWidget(
                disableDropdownButton : disableDropdownButton,
                onChanged: onBillTypeChange,
                hintText: billTypeValue,
                items: billTypeItems,
                color: Colors.black, // can be refactor in the future
                //TODO: Refactor colors and background if neccessary
              ),
              DropDownMenuWidget(
                disableDropdownButton: disableDropdownButton,
                onChanged: onAnnuallyDropdownChanged,
                hintText: monthlyValue,
                items: units == null
                    ? ['/yr', '/mo']
                    : units, // can be changed in the future to handle bi-weekly
                // but for now , we can leave as it is
                color: Colors.black,
              )
            ],
          ),
          if (helperText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LabelTitleWidget(title: helperText!),
            ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
