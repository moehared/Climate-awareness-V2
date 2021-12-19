class Place {
  final String streetNumber;
  final String street;
  final String city;
  final String zipCode;
  Place({
    required this.streetNumber,
    required this.street,
    required this.city,
    required this.zipCode,
  });

  


  @override
  String toString() {
    return 'Place(streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode)';
  }

  Place copyWith({
    String? streetNumber,
    String? street,
    String? city,
    String? zipCode,
  }) {
    return Place(
      streetNumber: streetNumber ?? this.streetNumber,
      street: street ?? this.street,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
