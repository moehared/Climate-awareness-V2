import 'package:app/domain/models/questionaire-model/category.dart';

abstract class ServiceEmission implements Category {
  Map<String, dynamic> toMap();
}
