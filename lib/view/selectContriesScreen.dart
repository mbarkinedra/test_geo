// geo_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/geo_controller.dart';
import '../data/model/cityModel.dart';
import '../data/model/countryModel.dart';
import 'imageScreen.dart';

class GeoScreen extends StatelessWidget {
  final GeoController controller = Get.put(GeoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Location')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => DropdownButtonFormField<Country>(
              value: null,
              items: controller.countries.map((country) {
                return DropdownMenuItem<Country>(
                  value: country,
                  child: Text(country.name),
                );
              }).toList(),
              onChanged: (Country? country) {
                if (country != null) {
                  controller.fetchCitiesByCountry(country.countryId);
                }
              },
              decoration: InputDecoration(
                labelText: 'Select Country',
              ),
            )),
            SizedBox(height: 20),
            Obx(() => DropdownButtonFormField<City>(
              value: null,
              items: controller.cities.map((city) {
                return DropdownMenuItem<City>(
                  value: city,
                  child: Text(city.name),
                );
              }).toList(),
              onChanged: (City? city) {
                if (city != null) {
                  // Handle city selection, e.g., save the selected city to the controller
                  controller.selectedCity.value = city;
                }
              },
              decoration: InputDecoration(
                labelText: 'Select City',
              ),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ImageScreen()); // Navigate to the next screen
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
