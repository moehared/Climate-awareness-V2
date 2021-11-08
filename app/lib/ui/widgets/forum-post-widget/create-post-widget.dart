import 'package:flutter/material.dart';

class CreateForumPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            onFieldSubmitted: (_) {},
            validator: (titleName) {
              if (titleName!.isEmpty) {
                return "Add a Title";
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: null,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            onFieldSubmitted: (_) {},
            validator: (description) {
              if (description!.isEmpty) {
                return "Add a Description";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
