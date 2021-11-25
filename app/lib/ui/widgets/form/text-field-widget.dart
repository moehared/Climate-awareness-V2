import 'package:app/common/styles/textfield-form.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
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
        textAlign: TextAlign.center,
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
