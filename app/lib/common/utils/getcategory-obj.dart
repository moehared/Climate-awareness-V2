import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import '../../../../main.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';


dynamic? getCategoryObject(int index) {
  if (questionaireMap.categoryMap.isEmpty) return;
  switch (index) {
    case 0:
      return questionaireMap.categoryMap.values.elementAt(0) as Utilities;
    case 1:
      return questionaireMap.categoryMap.values.elementAt(1) as Transportation;
    case 2:
      return questionaireMap.categoryMap.values.elementAt(2) as Food;
    case 3:
      return questionaireMap.categoryMap.values.elementAt(3) as GoodsServices;
    default:
      return null;
  }
}
