import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDownMenuWidget> {
  String chosenValue = "Select";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [],
    );
  }
}
