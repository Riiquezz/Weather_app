import 'package:cloudwalk_weather/pages/forecast/binding/forecast_binding.dart';
import 'package:cloudwalk_weather/pages/forecast/view/forecast_view.dart';
import 'package:cloudwalk_weather/pages/main/binding/main_binding.dart';
import 'package:cloudwalk_weather/pages/main/view/main_view.dart';
import 'package:cloudwalk_weather/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef RouteParameterBuilder = Widget Function(Map);

class AppRouter {
  static final routes = [
    GetPage(
      title: 'Main',
      name: Routes.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      title: 'Forecast',
      name: Routes.forecast,
      page: () => const ForecastView(),
      binding: ForecastBinding(),
    ),
  ];
}
