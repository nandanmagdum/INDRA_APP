import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/utils/api_urls.dart';

class ChatService {
  Dio dio = Dio();

  Future addChat(String prompt, String answer) async {
    debugPrint("addChat function is called");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("jwt")!;
    try {
      Response response = await dio.post(base_url,
          data: {"prompt": prompt, "answer": answer},
          options: Options(headers: {"Authorization": token}));

      print(
          "Status Code : ${response.statusCode}  Response Data : ${response.data}");
    } on DioException catch (e) {
      print("Error occured whlile adding chat : $e");
      throw Exception(e);
    }
  }

  Future<dynamic> getChats() async {
    debugPrint("getChat function is called");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("jwt")!;
    print(token);
    try {
      Response response = await dio.post(base_url,
          options: Options(headers: {"Authorization": token}));
      print(
          "Status Code : ${response.statusCode}  Response Data : ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print("Error occured whlile adding chat : $e");
      throw Exception(e);
    }
  }
}
