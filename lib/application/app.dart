import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/application/state_holder_binder/state_binders.dart';
import 'package:weather_app/presentation/ui/screens/home_screen.dart';

class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      initialBinding: GetXBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home:HomeScreen() ,
    );

  }

}
