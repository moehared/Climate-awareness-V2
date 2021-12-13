import 'package:app/common/styles/style.dart';
import 'package:flutter/material.dart';

class FormFieldDropDownWidget extends StatelessWidget {
  const FormFieldDropDownWidget({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.errorMessage,
    required this.items,
    this.backgroundColor,
    this.editMode = false,
    this.selectedColor = Colors.black,
  }) : super(key: key);
  final Function(String?)? onChanged;
  // final String value;
  final String hint;
  final List<String> items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final String errorMessage;
  final bool editMode;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(hint),
      decoration: kTextFieldform,
      dropdownColor: backgroundColor,
      onChanged: onChanged,
      validator: (value) {
        // if user edits any of the forums then we dont validate e.g user original category
        if (editMode) {
          return null;
        } else if (value == null) {
          return errorMessage;
        }
        return null;
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: selectedColor),
          ),
        );
      }).toList(),
    );
  }
}
