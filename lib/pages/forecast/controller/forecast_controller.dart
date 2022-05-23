import 'package:cloudwalk_weather/services/models/common/forecast_list_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForecastController extends GetxController {
  RxList<ForecastList> forecastList = <ForecastList>[].obs;
  RxString location = ''.obs;

  String date = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  //get the arguments from the previous page
  final dynamic getData = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    getForecastData();
    update();
  }

  void getForecastData() {
    getData.then((forecast) {
      forecast.list!
          .map((e) => {
                if (!e.dtTxt!.contains(date) && e.dtTxt!.contains('00:00:00'))
                  {
                    forecastList.add(e),
                    location.value =
                        '${forecast.city!.name}, ${forecast.city!.country}'
                  }
              })
          .toList();
    });
    update();
  }
}
