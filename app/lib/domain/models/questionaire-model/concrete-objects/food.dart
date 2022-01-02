import 'dart:convert';

import 'package:app/domain/models/questionaire-model/service-emission/service-emission.dart';

class Food extends ServiceEmission {
  final double meatFishEggs;
  final double grainsAndBakedGoods;
  final double diary;
  final double fruitsAndVegatables;
  final double snacksAndDrinks;
  final double meatOtherBeefLambPork;
  final double otherMeat;
  final double fishAndSeafood;
  final double poultryAndEggs;
  final String questionId;
  Food({
    required this.questionId,
    required this.meatFishEggs,
    required this.grainsAndBakedGoods,
    required this.diary,
    required this.fruitsAndVegatables,
    required this.snacksAndDrinks,
    required this.meatOtherBeefLambPork,
    required this.otherMeat,
    required this.fishAndSeafood,
    required this.poultryAndEggs,
  });

  Food copyWith({
    double? meatFishEggs,
    double? grainsAndBakedGoods,
    double? diary,
    double? fruitsAndVegatables,
    double? snacksAndDrinks,
    double? meatOtherBeefLambPork,
    double? otherMeat,
    double? fishAndSeafood,
    double? poultryAndEggs,
  }) {
    return Food(
      questionId: questionId,
      meatFishEggs: meatFishEggs ?? this.meatFishEggs,
      grainsAndBakedGoods: grainsAndBakedGoods ?? this.grainsAndBakedGoods,
      diary: diary ?? this.diary,
      fruitsAndVegatables: fruitsAndVegatables ?? this.fruitsAndVegatables,
      snacksAndDrinks: snacksAndDrinks ?? this.snacksAndDrinks,
      meatOtherBeefLambPork:
          meatOtherBeefLambPork ?? this.meatOtherBeefLambPork,
      otherMeat: otherMeat ?? this.otherMeat,
      fishAndSeafood: fishAndSeafood ?? this.fishAndSeafood,
      poultryAndEggs: poultryAndEggs ?? this.poultryAndEggs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId':questionId,
      'meatFishEggs': meatFishEggs,
      'grainsAndBakedGoods': grainsAndBakedGoods,
      'diary': diary,
      'fruitsAndVegatables': fruitsAndVegatables,
      'snacksAndDrinks': snacksAndDrinks,
      'meatOtherBeefLambPork': meatOtherBeefLambPork,
      'otherMeat': otherMeat,
      'fishAndSeafood': fishAndSeafood,
      'poultryAndEggs': poultryAndEggs,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      questionId: map['questionId'],
      meatFishEggs: map['meatFishEggs']?.toDouble() ?? 0.0,
      grainsAndBakedGoods: map['grainsAndBakedGoods']?.toDouble() ?? 0.0,
      diary: map['diary']?.toDouble() ?? 0.0,
      fruitsAndVegatables: map['fruitsAndVegatables']?.toDouble() ?? 0.0,
      snacksAndDrinks: map['snacksAndDrinks']?.toDouble() ?? 0.0,
      meatOtherBeefLambPork: map['meatOtherBeefLambPork']?.toDouble() ?? 0.0,
      otherMeat: map['otherMeat']?.toDouble() ?? 0.0,
      fishAndSeafood: map['fishAndSeafood']?.toDouble() ?? 0.0,
      poultryAndEggs: map['poultryAndEggs']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Food(meatFishEggs: $meatFishEggs, grainsAndBakedGoods: $grainsAndBakedGoods, diary: $diary, fruitsAndVegatables: $fruitsAndVegatables, snacksAndDrinks: $snacksAndDrinks, meatOtherBeefLambPork: $meatOtherBeefLambPork, otherMeat: $otherMeat, fishAndSeafood: $fishAndSeafood, poultryAndEggs: $poultryAndEggs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Food &&
        other.meatFishEggs == meatFishEggs &&
        other.grainsAndBakedGoods == grainsAndBakedGoods &&
        other.diary == diary &&
        other.fruitsAndVegatables == fruitsAndVegatables &&
        other.snacksAndDrinks == snacksAndDrinks &&
        other.meatOtherBeefLambPork == meatOtherBeefLambPork &&
        other.otherMeat == otherMeat &&
        other.fishAndSeafood == fishAndSeafood &&
        other.poultryAndEggs == poultryAndEggs;
  }

  @override
  int get hashCode {
    return meatFishEggs.hashCode ^
        grainsAndBakedGoods.hashCode ^
        diary.hashCode ^
        fruitsAndVegatables.hashCode ^
        snacksAndDrinks.hashCode ^
        meatOtherBeefLambPork.hashCode ^
        otherMeat.hashCode ^
        fishAndSeafood.hashCode ^
        poultryAndEggs.hashCode;
  }
}
