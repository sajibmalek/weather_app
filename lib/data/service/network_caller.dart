import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/data/models/network_response.dart';

class NetworkCaller{

  Future<NetworkResponse> getRequest(String ulr) async{

    try{
      Response response=await get(Uri.parse(ulr));
      if(response.statusCode==200){
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, responseJson: jsonDecode(response.body));
      }
      else if(response.statusCode==404){
        log(response.statusCode.toString());
      }
      else{
          return NetworkResponse(isSuccess: false, statusCode: -1, responseJson: null);
      }
    }
    catch(e){
      log(e.toString());
    }

    return NetworkResponse(isSuccess: false, statusCode: -1, responseJson: null);

  }

  Future<String> getCurrentCity() async{
    // get user permission
    LocationPermission permission= await Geolocator.checkPermission();
    if(permission== LocationPermission.denied){
      permission=await Geolocator.requestPermission();
    }
    // fatch current location

    Position position=await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    // convert the location into a list of placemark objects

    List<Placemark> placeMarks= await placemarkFromCoordinates(position.latitude, position.longitude);

    String ? city=placeMarks[0].locality;

    return city??'';

  }

}