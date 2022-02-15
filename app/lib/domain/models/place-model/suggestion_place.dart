import 'dart:convert';

class SuggestionPlace {
  final int placeID;
  final String name;
  final String lat;
  final String lon;
  final int osmId;
  SuggestionPlace({
    required this.placeID,
    required this.name,
    required this.lat,
    required this.lon,
    required this.osmId,
  });
 

  SuggestionPlace copyWith({
    int? placeID,
    String? name,
    String? lat,
    String? lon,
    int? osmId,
  }) {
    return SuggestionPlace(
      placeID: placeID ?? this.placeID,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      osmId: osmId ?? this.osmId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeID': placeID,
      'name': name,
      'lat': lat,
      'lon': lon,
      'osmId': osmId,
    };
  }

  factory SuggestionPlace.fromMap(Map<String, dynamic> map) {
    return SuggestionPlace(
      placeID: map['placeID']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lat: map['lat'] ?? '',
      lon: map['lon'] ?? '',
      osmId: map['osmId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestionPlace.fromJson(String source) => SuggestionPlace.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuggestionPlace(placeID: $placeID, name: $name, lat: $lat, lon: $lon, osmId: $osmId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SuggestionPlace &&
      other.placeID == placeID &&
      other.name == name &&
      other.lat == lat &&
      other.lon == lon &&
      other.osmId == osmId;
  }

  @override
  int get hashCode {
    return placeID.hashCode ^
      name.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      osmId.hashCode;
  }
}
