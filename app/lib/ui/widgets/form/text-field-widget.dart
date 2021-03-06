import 'package:app/common/styles/style.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    required this.onChanged,
    this.onSumbitted,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.helperText,
    this.onEditComplete,
    this.addHorizontalPadding = true,
  }) : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final Function(String?)? onChanged;
  final Function(String)? onSumbitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onEditComplete;
  final bool addHorizontalPadding;
  final String? helperText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: addHorizontalPadding ? 20 : 0,
        vertical: 10,
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: onEditComplete,
        onChanged: onChanged,
        onSubmitted: onSumbitted,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textInputAction: textInputAction,
        decoration: kTextFieldform.copyWith(
          // helperText: helperText,
          helperStyle: TextStyle(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green.shade700,
              width: 1,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
