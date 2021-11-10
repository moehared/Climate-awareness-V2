import 'package:flutter/material.dart';


class DropDownMenuWidget extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();


}



class _DropDownState extends State<DropDownMenuWidget> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
  return DropdownButton<String>(
      value: dropdownValue,
      hint: Text('Select a catergory',
      style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Environment', 'Climate Awareness', 'Other', 'More']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(color: Colors.black)),
        );
      }).toList(),
    );
  
  }



}
