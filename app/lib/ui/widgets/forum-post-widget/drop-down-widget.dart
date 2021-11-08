import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDownMenuWidget> {
  String dropDownValue = "Select";
  @override
  Widget build(BuildContext context) {
    items: [];
    return DropdownButton<String>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize:  24,
      elevation: 16,
      style:  const TextStyle(color: Colors.deepPurple),
      underline:  Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue){
        setState(() {
          dropDownValue = newValue!;
        });
      },
      items: <String>['Environment', 'Climate', 'DIY', 'Other']
        .map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
    );
  }
}
