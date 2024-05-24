import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FertilizerService {
  Dio dio = Dio();

  Future<dynamic> predictFertilizer(
      String crop, int Nitrogen, int Potassium, int Phosphorous) async {
    debugPrint("--------prodictFertilizer function is called--------");
    print("$crop  $Nitrogen  $Potassium  $Phosphorous");

    try {
      Response response = await dio.post(
          "https://fertilizer-prediction-skoz.onrender.com/fertilizer-predict",
          data: {
            "crop": crop,
            "N": Nitrogen,
            "P": Phosphorous,
            "K": Potassium
          });

      return response.data;
    } on DioException catch (e) {
      print("Error occoured while predicting fertilizer : $e");
      throw Exception(e);
    }
  }
}
