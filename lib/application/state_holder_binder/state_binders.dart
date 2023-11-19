import 'package:get/get.dart';
import 'package:weather_app/presentation/state_holder/home_data_controller.dart';

class GetXBindings  extends Bindings{
  @override
  void dependencies() {
Get.put(HomeController());


  }

}