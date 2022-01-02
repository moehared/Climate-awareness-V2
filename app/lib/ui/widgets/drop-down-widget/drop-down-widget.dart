import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget({
    this.onChanged,
    required this.hintText,
    this.color = Colors.white,
    required this.items,
    this.dropdownColor = Colors.white,
    this.hideDropdownIcon = false,
    this.disableDropdownButton = false,
  });
    final bool disableDropdownButton;
  final Function(String?)? onChanged;
  final String hintText;
  final Color color;
  final List<String>? items;
  final Color? dropdownColor;
  final bool hideDropdownIcon;
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
          
          iconSize: hideDropdownIcon ? 0 : 24,
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
          onChanged: disableDropdownButton ? null :  onChanged,
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
