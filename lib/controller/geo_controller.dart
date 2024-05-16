import 'package:get/get.dart';

import '../data/model/cityModel.dart';
import '../data/model/countryModel.dart';
import '../data/repository/geoRepository.dart';

class GeoController extends GetxController {
  final GeoRepository _repository = GeoRepository();
  var countries = <Country>[].obs;
  var cities = <City>[].obs;
  var selectedCity = City?.fromJson({}).obs;

  @override
  void onInit() {
    fetchCountries(); // Fetch countries when the controller is initialized
    super.onInit();
  }

  void fetchCountries() async {
    try {
      countries.value = await _repository.fetchCountries();
    } catch (e) {
      print('Error fetching countries: $e');
    }
  }

  void fetchCitiesByCountry(int countryId) async {
    try {
      cities.value = await _repository.fetchCitiesByCountry(countryId);
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }
}
