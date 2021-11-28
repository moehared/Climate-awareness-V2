import 'dart:convert';

class SuggestionPlace {
  final String placeID;
  final String name;
  SuggestionPlace({
    required this.placeID,
    required this.name,
  });

  

  SuggestionPlace copyWith({
    String? placeID,
    String? name,
  }) {
    return SuggestionPlace(
      placeID: placeID ?? this.placeID,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeID': placeID,
      'name': name,
    };
  }

  factory SuggestionPlace.fromMap(Map<String, dynamic> map) {
    return SuggestionPlace(
      placeID: map['placeID'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestionPlace.fromJson(String source) => SuggestionPlace.fromMap(json.decode(source));

  @override
  String toString() => 'SuggestionPlaces(placeID: $placeID, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SuggestionPlace &&
      other.placeID == placeID &&
      other.name == name;
  }

  @override
  int get hashCode => placeID.hashCode ^ name.hashCode;
}
