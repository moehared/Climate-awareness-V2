import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/widgets/error_widget/error_text_widget.dart';
import 'package:app/ui/widgets/user-search-cards.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List<String> toDisplay;

  SearchResults(this.toDisplay);

  @override
  Widget build(BuildContext context) {
    if (toDisplay.isEmpty) {
      return ErrorTextWidget(
        errorMsg: 'Nothing To see.',
      );
    }
    List<Widget> cardWidget = toDisplay.map<Widget>((e) {
      print("from SearchResults ${e}");
      return ListTile(
        title: Text(" ${e}"),
        onTap: () => {
          showDialog(
              context: context,
              builder: (_) => Dialog(
                    child: Container(
                      width: 250,
                      height: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Create chat room with ${e}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           
                            children: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: Text("Continue"),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
          print("I pressed a tile ${e}")
        },
        //subtitle: Text("Something here"),
      );
    }).toList();

    if (cardWidget.isEmpty) {
      return ErrorTextWidget(
        errorMsg: 'Nothing To see.',
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: toDisplay.length,
      itemBuilder: (_, index) {
        return cardWidget[index];
      },
    );
  }
}
