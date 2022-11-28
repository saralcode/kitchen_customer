import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:kitchen_customer/tabbarview/tabbarview.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange.shade700),
    ),
    home: const TabNavigation(),
  ));
}
