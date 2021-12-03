import 'package:app/domain/models/place-model/suggestion_place.dart';
import 'package:flutter/material.dart';

class PredictionPlaceWidget extends StatelessWidget {
  const PredictionPlaceWidget({
    Key? key,
    required this.predictionPlace,
    required this.onSelected,
  }) : super(key: key);
  final List<SuggestionPlace> predictionPlace;
  final Function(SuggestionPlace?) onSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 200,
      child: predictionPlace.isEmpty
          ? Center(
              child: Text('Could not find the city you entered'),
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
