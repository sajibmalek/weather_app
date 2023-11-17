import 'package:flutter/material.dart';
import 'package:weather_app/presentation/ui/screens/home_screen.dart';

class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home:HomeScreen() ,
    );
  }
}
