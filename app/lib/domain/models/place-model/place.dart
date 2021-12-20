class SelectedCity {
  final String city;
  final String zipCode;
  final String country;
  SelectedCity({
    required this.country,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'Place(country: $country city: $city, zipCode: $zipCode)';
  }

  SelectedCity copyWith({
    String? country,
    String? city,
    String? zipCode,
  }) {
    return SelectedCity(
      country: country ?? this.country,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
