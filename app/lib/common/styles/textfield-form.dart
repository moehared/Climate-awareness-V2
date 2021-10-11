// ignore_for_file: file_names

import 'package:flutter/material.dart';

const kTextFieldform = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  hintText: "value",
  alignLabelWithHint: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
);
