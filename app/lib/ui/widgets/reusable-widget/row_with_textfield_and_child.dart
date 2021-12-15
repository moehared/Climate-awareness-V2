import 'package:app/ui/widgets/form/text-field-widget.dart';
import 'package:flutter/material.dart';

class RowWithTextFieldAndChild extends StatelessWidget {
  const RowWithTextFieldAndChild({
    Key? key,
    this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.child,
    required this.hintText,
  }) : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final Widget child;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            // flex: 3,
            child: TextFieldWidget(
              addHorizontalPadding: false,
              onChanged: (_) {},
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              controller: controller,
              hintText: hintText,
            ),
          ),
          SizedBox(width: 10),
          child,
        ],
      ),
    );
  }
}
