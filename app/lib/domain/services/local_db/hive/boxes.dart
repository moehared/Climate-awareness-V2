import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app/domain/models/Achievement-model.dart';
import 'package:path_provider/path_provider.dart';

class Boxes<T> {
  final String box;

  Boxes(this.box);

  void openBox() async {
    await Hive.openBox<T>(this.box);
  }

  void closeBox() {
    Hive.box(this.box).close();
  }

  Box<T> get getBox => Hive.box(this.box);
}
