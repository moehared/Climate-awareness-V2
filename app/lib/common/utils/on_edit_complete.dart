import 'package:flutter/material.dart';

void onEditComplete(BuildContext ctx, FocusNode focusNode) {
  FocusScope.of(ctx).requestFocus(focusNode);
}
