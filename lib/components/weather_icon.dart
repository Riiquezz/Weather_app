//Get weather description and select font awesome icon based on description
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

Widget weatherIcon(
    {String? weatherDescription, Color? color, double? size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(FluentIcons.weather_sunny_20_regular, color: color, size: size);
      }
    case "Clouds":
      {
        return Icon(FluentIcons.cloud_20_regular, color: color, size: size);
      }
    case "Rain":
      {
        return Icon(FluentIcons.weather_rain_20_regular, color: color, size: size);
      }
    case "Snow":
      {
        return Icon(FluentIcons.weather_snow_20_regular, color: color, size: size);
      }
    default:
      {
        return Icon(FluentIcons.weather_sunny_high_20_regular, color: color, size: size);
      }
  }
}