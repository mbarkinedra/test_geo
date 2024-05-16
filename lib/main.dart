import 'package:flutter/material.dart';
import 'package:geo_test/view/selectContriesScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GeoScreen(), // Set GeoScreen as the initial screen
    );
  }
}
