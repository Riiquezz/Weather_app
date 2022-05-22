import 'package:cloudwalk_weather/components/weather_icon.dart';
import 'package:cloudwalk_weather/pages/forecast/controller/forecast_controller.dart';
import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:cloudwalk_weather/utils/date_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ForecastView extends GetView<ForecastController> {
  final Future<ForeCastModel>? forecastData;
  const ForecastView({Key? key, this.forecastData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('common.see_next_five_days'.tr),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text(
              'common.see_weather_forecast'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
                    itemCount: controller.forecastList.length,
                    separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: Colors.black38,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                        ),
                    itemBuilder: (context, index) {
                      String fullDate = Util.getFormattedDate(
                          DateTime.fromMillisecondsSinceEpoch(
                              controller.forecastList[index].dt * 1000));
                      String dayOfWeek = fullDate.split(',')[0];
                      return ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.blue[50],
                          child: weatherIcon(
                              weatherDescription: controller
                                  .forecastList[index].weather![0].main,
                              color: Colors.blue,
                              size: 10),
                        ),
                        title: Text(
                          dayOfWeek,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Temperature = ${controller.forecastList[index].main!.temp!.toStringAsFixed(2)} F",
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            Text(
                              "Humidity = ${controller.forecastList[index].main!.humidity!.toStringAsFixed(2)} %",
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            Text(
                              "Wind = ${controller.forecastList[index].wind!.speed!.toStringAsFixed(2)} mi/h",
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
