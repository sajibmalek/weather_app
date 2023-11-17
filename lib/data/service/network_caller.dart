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
        print(response.statusCode);
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



}