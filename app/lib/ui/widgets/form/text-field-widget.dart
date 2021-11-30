import 'package:app/common/styles/textfield-form.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.onSumbitted,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onEditComplete,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final Function(String?)? onChanged;
  final Function(String)? onSumbitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onEditComplete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
