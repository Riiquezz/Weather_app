import 'package:cloudwalk_weather/services/models/forecast_model/forecast_list_model.dart';
import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForecastController extends GetxController {
  final argumentsData = Get.arguments;

  List<ForecastList> forecastList = [];
  String location = '';

  @override
  void onInit() {
    super.onInit();
    getForecastData();
  }

  getForecastData() {
    print(argumentsData);
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    argumentsData.then((forecast) {
      forecast.list!
          .map((e) => {
                // If date in API data contains present day's date do not add it to the new forecastList List
                // AND if API data contains 00:00:00, that is, 12am add it to the list
                if (!e.dtTxt!.contains(date) && e.dtTxt!.contains('00:00:00'))
                  {
                    forecastList.add(e),
                    location =
                        '${forecast.city!.name}, ${forecast.city!.country}',
                  }
              })
          .toList();
    });
  }
}
