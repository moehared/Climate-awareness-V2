import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/profile-view/personalized-tips-view/personalized-tips-view.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  // final String titleText;
  final String id;
  final String imageAsset;
  final String subTitle;

  ReusableCard({
    this.colour = Colors.white,
    this.imageAsset = '',
    required this.id,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: id.isNotEmpty
          ? () {
              locator<NavigationService>().navigateTo(
                  PersonalizedTipsDetailsView.routeName,
                  argument: id);
            }
          : null,
      child: Container(
        width: deviceSize.width * 0.40,
        margin: EdgeInsets.only(left: 10.0),
        height: deviceSize.height * 0.25 - 50,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Hero(
                  tag: id,
                  child: Image.asset(
                    imageAsset.isNotEmpty ? imageAsset : 'images/image.png',
                  ),
                ),
              ),
              SizedBox(height: 4),
              Flexible(
                child: Container(
                  width: deviceSize.width * 0.40,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
