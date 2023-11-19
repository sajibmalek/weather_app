import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/network_response.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/service/network_caller.dart';

class HomeController extends GetxController{

  bool _isWeatherInProgress=false;
  bool get isWeatherInProgress=>_isWeatherInProgress;
  WeatherModel _weatherModel=WeatherModel();
  WeatherModel get weatherModel=> _weatherModel;
  String errorMessage='';
  String url='';
  Future<bool> getData(String url)async{
    _isWeatherInProgress=true;
    update();

    final NetworkResponse response=await NetworkCaller().getRequest(url);
    _isWeatherInProgress=false;
    if(response.isSuccess){
      _weatherModel=WeatherModel.fromJson(response.responseJson??{});
      update();
      return true;
    }
    else{
      errorMessage='fetch failed';
      update();
      return false;
    }


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
    print(city);
    return city??'';
  }




}