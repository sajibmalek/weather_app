import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/service/network_caller.dart';

import '../../../data/models/network_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<WeatherModel> _weather=[];


  static const apiKey='';
 // static String baseUrl='https://api.openweathermap.org';

void fatchWeather() async{
   String  apiKey='35b02f6681185c5b6bd827482c79ef5c';

  Future<String> cityName=NetworkCaller().getCurrentCity();

   String baseUrl='https://api.openweathermap.org/data/2.5/weather?lat=24.363589&lon=88.624135&appid=35b02f6681185c5b6bd827482c79ef5c';
   final NetworkResponse response =  await NetworkCaller().getRequest(baseUrl);

  Map<String,dynamic> weatherlist;
   print(response.statusCode);
   if(response.isSuccess){
   setState(() {
     _weather=weatherlist.map((value) =>WeatherModel.fromJson(json)).toString()
   });

   }

   print(_weather);


}


@override
  void initState() {
    super.initState();
    fatchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_weather?.cityName??'Loading City'),
  Text('${_weather?.temperature.toString()}+C')
          ],
        ),
      ),
    );
  }
}
