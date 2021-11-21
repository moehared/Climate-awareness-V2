import 'package:app/domain/models/questionaire-model/category.dart';

class Food implements Category {
  @override
  double c02() {
    // TODO: implement c02
    throw UnimplementedError();
  }

  @override
  List<String> questions() {
    // TODO: implement questions
    throw UnimplementedError();
  }

  @override
  String title() {
    return 'Food';
  }
}
