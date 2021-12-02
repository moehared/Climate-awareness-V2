import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showPopUpMenu({required BuildContext context ,required Widget child}) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => child,
    
  );
}
