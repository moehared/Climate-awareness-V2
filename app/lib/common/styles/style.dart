// ignore_for_file: file_names

import 'package:flutter/material.dart';


const kTextFieldform = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  hintText: "value",
  errorStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    backgroundColor: Color(0xFFd4e3d3),
    fontStyle: FontStyle.italic,
  ),
  alignLabelWithHint: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
);

const userPostFormStyle = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  labelStyle: TextStyle(color: Colors.white),
  hintText: "value",
  hintStyle: TextStyle(color: Colors.white),
  errorStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    backgroundColor: Color(0xFFd4e3d3),
    fontStyle: FontStyle.italic,
  ),
  alignLabelWithHint: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
);

const kTextTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);

final kSimpleOrAdvanceContainerStyle = BoxDecoration(
  border: Border.all(
    color: Colors.grey,
  ),
);

final kTextButtonStyle = (ctx) => TextStyle(
  color: Theme.of(ctx).colorScheme.secondary,
);
