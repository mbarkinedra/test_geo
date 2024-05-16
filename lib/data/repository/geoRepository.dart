import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/cityModel.dart';
import '../model/countryModel.dart';


class GeoRepository {
  final String _baseUrl = 'http://165.16.11.220/auth/api/geological_addressing';

  Future<List<Country>> fetchCountries() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/countries/fetch/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((e) => Country.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<City>> fetchCitiesByCountry(int countryId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/cities/fetch/by_country'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'country_id': countryId}),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((e) => City.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
