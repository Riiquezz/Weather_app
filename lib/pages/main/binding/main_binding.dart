import 'package:cloudwalk_weather/pages/forecast/controller/forecast_controller.dart';
import 'package:cloudwalk_weather/pages/main/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<ForecastController>(
      () => ForecastController(),
    );
  }
}
