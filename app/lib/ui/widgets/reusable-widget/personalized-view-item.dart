import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/profile-view/personalized-tips-view/personalized-tips-view.dart';
import 'package:flutter/material.dart';

class PersonalizedItems extends StatelessWidget {
  final String title;
  final String id;
  final String image;

  PersonalizedItems({
  required this.title, 
  required this.id, 
  required this.image,});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () => locator<NavigationService>().navigateTo(PersonalizedTipsDetailsView.routeName,argument: id),
            child: Hero(
              tag: id,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87.withOpacity(0.5),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
