import 'package:cloudwalk_weather/components/weather_icon.dart';
import 'package:cloudwalk_weather/exceptions/network_error.dart';
import 'package:cloudwalk_weather/pages/forecast/view/forecast_view.dart';
import 'package:cloudwalk_weather/pages/main/controller/main_controller.dart';
import 'package:cloudwalk_weather/router/routes.dart';
import 'package:cloudwalk_weather/services/datasource/weather_service.dart';
import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:cloudwalk_weather/utils/date_converter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(FluentIcons.book_information_24_regular,
              color: Colors.black, size: 30),
          onPressed: () {
            controller.webview('https://github.com/Riiquezz/weather_app');
          },
        ),
        centerTitle: true,
        title: Text(
          'common.app_name'.tr,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ListView(
            children: [
              TextField(
                  decoration: InputDecoration(
                      hintText: 'common.search_hint'.tr,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () async {
                          if (controller.searchValue.isNotEmpty) {
                            if (controller.hasInternetConnection == false) {
                              CustomToast().errorToast(
                                  context, 'common.network_error'.tr);
                            } else {
                              controller.cityName = controller.searchValue;

                              controller.weatherData = WeatherService()
                                  .getWeatherData(
                                      cityName: controller.cityName);
                              controller.forecastData = WeatherService()
                                  .getWeatherForecastData(
                                      cityName: controller.cityName);
                            }
                          } else {
                            CustomToast()
                                .errorToast(context, 'common.field_error'.tr);
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(8)),
                  onChanged: (value) => {
                        controller.searchValue = value,
                      }),
              controller.cityName.isEmpty
                  ? controller.hasInternetConnection == false
                      ? Center(
                          child: Text('common.you_are_offline'.tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: Text('common.see_weather_updates'.tr,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Center(
                              child: Text(
                                  'common.see_weather_updates_description'.tr,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        )
                  :
                  // Display present day weather data of the city
                  FutureBuilder<WeatherModel>(
                      future: controller.weatherData,
                      builder: (BuildContext context,
                          AsyncSnapshot<WeatherModel> data) {
                        if (data.connectionState == ConnectionState.none &&
                            data.hasData == false) {
                          return Text(
                            'common.no_data_for_this_city'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 17),
                          );
                        } else if (data.hasData) {
                          //Store weather data in model class and use that to fill all the other fields
                          WeatherModel? item = data.data;
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${item!.name.toString()}, ${item.sys?.country.toString()}',
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Util.getFormattedDate(
                                    DateTime.fromMillisecondsSinceEpoch(
                                  item.dt! * 1000,
                                )),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              weatherIcon(
                                  weatherDescription: item.weather![0].main,
                                  color: Colors.blueAccent,
                                  size: 198),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${item.main!.temp!.toStringAsFixed(2)} F",
                                      style: const TextStyle(fontSize: 34),
                                    ),
                                    Text(
                                        "${item.weather![0].description!.toUpperCase()} ")
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${item.wind?.speed?.toStringAsFixed(1)} mi/h",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Icon(
                                        FluentIcons.temperature_20_regular,
                                        size: 20,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${item.main?.humidity?.toStringAsFixed(0)} %",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Icon(
                                        FluentIcons.weather_sunny_20_regular,
                                        size: 20,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${item.main?.tempMax?.toStringAsFixed(0)} F",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Icon(
                                        FluentIcons.temperature_20_regular,
                                        size: 20,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(ForecastView(
                                      forecastData: controller.forecastData,
                                    ));
                                  },
                                  child: Text(
                                    'common.see_next_five_days'.tr,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ))
                            ],
                          );
                        }
                        return const SizedBox(
                          height: 60,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.grey),
                              strokeWidth: 5.0,
                            ),
                          ),
                        );
                      })
            ],
          )),
    );
  }
}
