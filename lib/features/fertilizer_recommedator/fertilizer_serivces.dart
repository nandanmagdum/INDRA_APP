import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/languages/language_translators.dart';

class FertilizerService {
  Dio dio = Dio();

  Future<dynamic> predictFertilizer(
      String crop, int Nitrogen, int Potassium, int Phosphorous) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
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
          // final converted = await LanguageTranslators.translateObjectRecursive(obj: response.data, sourceLanguage: "en", targetLanguage: prefs.getString("lang"));
      return response.data;
      // return converted;
    } on DioException catch (e) {
      print("Error occoured while predicting fertilizer : $e");
      throw Exception(e);
    }
  }
}
