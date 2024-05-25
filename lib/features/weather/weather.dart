import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherForecastServices {
// https://api.weatherapi.com/v1/forecast.json?key=720b1b0b36ce489da4b91524240502&q=19.39501850100153,%2074.64064993733906&days=7&aqi=no&alerts=no

  Dio dio = Dio();
  String wheatherAPI =
      "https://api.weatherapi.com/v1/forecast.json?key=720b1b0b36ce489da4b91524240502";

  Future<dynamic> getData(String lattitude, String langitude) async {
    debugPrint("---  get Data function is called  ---");

    try {
      Response response = await dio.get(
          "${wheatherAPI}&q=${lattitude},%${langitude}&days=7&aqi=no&alerts=no");

      print(
          "Reponse StatusCode : ${response.statusCode}  Response Data : ${response.data}");

      return response.data;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
