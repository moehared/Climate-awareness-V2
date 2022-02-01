import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/models/place-model/suggestion_place.dart';
import 'package:app/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class PredictionPlaceWidget extends StatelessWidget {
  const PredictionPlaceWidget({
    Key? key,
    required this.predictionPlace,
    required this.onSelected,
    this.isBusy = false,
  }) : super(key: key);
  final List<SuggestionPlace> predictionPlace;
  final Function(SuggestionPlace?) onSelected;
  final bool isBusy;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 200,
      child: isBusy
          ? Center(
              child: Loading(
              color: Theme.of(context).colorScheme.primaryVariant,
            ))
          : predictionPlace.isEmpty
              ? Center(
                  child: Text('Could not find bothe city you entered'),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ListTile(
                      title: Text(predictionPlace[index].name),
                      onTap: () => onSelected(predictionPlace[index]),
                    ),
                  ),
                  itemCount: predictionPlace.length,
                ),
    );
  }
}
