import 'package:app/common/utils/getcategory-obj.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/personalized-tips-viewmodel.dart/personalized-view-all-viewmodel.dart';
import 'package:app/main.dart';
import 'package:app/ui/widgets/reusable-widget/personalized-view-item.dart';
import 'package:flutter/material.dart';

class PersonalizedViewAll extends StatelessWidget {
  const PersonalizedViewAll({Key? key}) : super(key: key);
  static const String PERSONALIZED_VIEW_ALL = '/PERSONALIZED_VIEW_ALL';
  @override
  Widget build(BuildContext context) {

    return BuildViewModel<PersonalizedViewAllViewmodel>(
      builder: (ctx, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Your Personalized Tips'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Personalized tips for you',
                  style: TextStyle(
                    fontFamily: 'Roboto-Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              questionaireMap.categoryMap.isEmpty
                  ? Center(
                      child: Text(
                        'No personalized tips yet. Start answering questionnaires',
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: questionaireMap.categoryMap.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx, index) {
                          var data = getCategoryObject(index);
                          return PersonalizedItems(
                            id: data.questionID,
                            image: data.imageAsset,
                            title: data.title,
                          );
                          // final item = product.items[index];
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
