import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/service/network_caller.dart';
import 'package:weather_app/presentation/state_holder/home_data_controller.dart';

import '../../../data/models/network_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Weather? _weather;


  static const apiKey='';
 // static String baseUrl='https://api.openweathermap.org';



@override
  void initState() {
    super.initState();
    Get.find<HomeController>().getData('https://api.openweathermap.org/data/2.5/weather?lat=24.363589&lon=88.624135&appid=35b02f6681185c5b6bd827482c79ef5c');
    Get.find<HomeController>().getCurrentCity();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
      builder: ( controller) {
        if(controller.isWeatherInProgress){
          return const CircularProgressIndicator();
        }
        return  Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${controller.weatherModel.main!.tempMin??'' }'),
                Text('Max Temp" ${controller.weatherModel.main!.tempMax??'' }'),
                Text('Max Temp" ${controller.weatherModel.main!.humidity??'' }'),
                Text('Max Temp" ${controller.weatherModel.name }'),
                Text('Max Temp" ${controller.weatherModel.wind?.gust }'),
              //  Image.network('${controller.weatherModel.weather?['']??''}',width: 20,height: 10,)

               // Text('${_weather?.temperature.toString()}+C')
              ],
            ),
          ),
        );
      },

    );
  }
}
