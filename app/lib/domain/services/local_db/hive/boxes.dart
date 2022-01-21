import 'package:hive/hive.dart';

class Boxes<T> {
  final String box;

  Boxes(this.box);
  
  void openBox() async  {
    await Hive.openBox<T>(this.box);
  }

  void closeBox() {
    Hive.box(this.box).close();
  }

   Box<T> get getQuestionaireResultBox =>
      Hive.box(this.box);
}
