import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List<String> toDisplay;

  SearchResults(this.toDisplay);

  @override
  Widget build(BuildContext context) {
    if(toDisplay.isEmpty){
      return ErrorTextWidget(
        errorMsg: 'Nothing To see.',
      );
    }
    List<Widget> cardWidget = toDisplay.map<Widget>((e) {
      print("from SearchResults ${e}");
      return ListTile(
        title: Text("${e}"),
        subtitle: Text("Something here"),
      );
    }).toList();

    if (cardWidget.isEmpty) {
      return ErrorTextWidget(
        errorMsg: 'Nothing To see.',
      );
    }

    return ListView.builder(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: toDisplay.length,
      itemBuilder: (_, index) {
        return cardWidget[index];
      },
    );
  }
}
