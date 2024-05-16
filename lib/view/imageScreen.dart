// image_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/geo_controller.dart';

class ImageScreen extends StatelessWidget {
  final GeoController controller = Get.find(); // Find the instance of GeoController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Screen')),
      body: Center(
        child: Obx(() {
          if (controller.selectedCity.value == null) {
            return Text('No city selected'); // Display message if no city is selected
          } else {
            String imageUrl = 'http://165.16.11.220/auth/api/geological_addressing_${controller.selectedCity.value.name}.jpg';
            return Image.network(
              imageUrl,
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return Text('Error loading image');
              },
            );
          }
        }),
      ),
    );
  }
}
