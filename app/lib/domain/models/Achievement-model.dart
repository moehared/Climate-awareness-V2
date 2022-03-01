import 'dart:convert';
enum AchievementTypes {
  ECO_FRIENDLY,

  ECO_WARRIOR,

  GO_GREEN,

  SAVE_THE_PLANET,
  // ADD MORE AchievementTypes
}
class Achievement {

  final String icon;

  final String description;

  final String achievementTypes;
  Achievement({
    required this.icon,
    required this.description,
    required this.achievementTypes,
  });

  Achievement copyWith({
    String? icon,
    String? description,
    String? achievementTypes,
  }) {
    return Achievement(
      icon: icon ?? this.icon,
      description: description ?? this.description,
      achievementTypes: achievementTypes ?? this.achievementTypes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'description': description,
      'achievementTypes': achievementTypes,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      icon: map['icon'] ?? '',
      description: map['description'] ?? '',
      achievementTypes: map['achievementTypes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) =>
      Achievement.fromMap(json.decode(source));

  @override
  String toString() =>
      'Achievement(icon: $icon, description: $description, achievementTypes: $achievementTypes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Achievement &&
        other.icon == icon &&
        other.description == description &&
        other.achievementTypes == achievementTypes;
  }

  @override
  int get hashCode =>
      icon.hashCode ^ description.hashCode ^ achievementTypes.hashCode;
}
