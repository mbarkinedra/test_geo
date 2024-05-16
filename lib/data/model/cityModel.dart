class City {
  final int cityId;
  final int countryId;
  final String name;

  City({required this.cityId, required this.countryId, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'] ?? 0,
      countryId: json['country_id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}