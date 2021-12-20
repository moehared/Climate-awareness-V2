import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget({
    required this.onChanged,
    required this.hintText,
    this.color = Colors.white,
    required this.items,
    this.dropdownColor = Colors.white,
  });
  final Function(String?)? onChanged;
  final String hintText;
  final Color color;
  final List<String>? items;
  final Color? dropdownColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          // color: Colors.cyan,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        child: DropdownButton<String>(
          underline: Container(),
          dropdownColor: dropdownColor,
          hint: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              hintText,
              style: TextStyle(color: color),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          items: items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: color),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
