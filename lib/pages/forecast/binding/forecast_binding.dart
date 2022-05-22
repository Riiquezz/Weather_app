import 'package:cloudwalk_weather/pages/forecast/controller/forecast_controller.dart';
import 'package:get/get.dart';

class ForecastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForecastController>(
      () => ForecastController(),
    );
  }
}