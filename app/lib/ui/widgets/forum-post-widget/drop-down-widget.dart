import 'package:flutter/material.dart';

typedef OnChangeCallback = void Function(dynamic value);
class DropDownMenuWidget extends StatefulWidget {
//TODO: pass in a array of strings that will be stored into items 

  final OnChangeCallback onChanged;

  DropDownMenuWidget({ required this.onChanged});

  @override
  _DropDownState createState() => _DropDownState();


}

class _DropDownState extends State<DropDownMenuWidget> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
  return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: Theme.of(context).colorScheme.secondary,
      hint: Text('Select a category',
      style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
          widget.onChanged(dropdownValue);
      },
      items: <String>['Environment', 'Climate Awareness', 'Media', 'Article']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(color: Colors.white)),
        );
      }).toList(),
    );
  
  }

}




