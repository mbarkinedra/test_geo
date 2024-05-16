class Country {
  final int countryId;
  final String name;

  Country({required this.countryId, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryId: json['country_id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}