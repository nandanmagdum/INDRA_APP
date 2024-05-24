import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/chatbot/chat_model.dart';
import 'package:version1/utils/api_urls.dart';

class ChatService {
  Dio dio = Dio();

  Future addChat(String prompt, String answer) async {
    debugPrint("addChat function is called");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("jwt")!;
    try {
      Response response = await dio.post("${base_url}prompt/",
          data: {"prompt": prompt, "answer": answer},
          options: Options(headers: {"Authorization": token}));

      print(
          "Status Code : ${response.statusCode}  Response Data : ${response.data}");
    } on DioException catch (e) {
      print("Error occured whlile adding chat : $e");
      throw Exception(e);
    }
  }

  Future<List<ChatModel>> getChats() async {
    debugPrint("getChat function is called");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("jwt")!;
    print(token);
    try {
      Response response = await dio.get("${base_url}prompt/",
          options: Options(headers: {"Authorization": token}));

      print(
          "Status Code : ${response.statusCode}  Response Data : ${response.data}");

      List data = response.data as List;
      List<ChatModel> res = [];

      print("---------------- This is res ------------------");

      for (int i = 0; i < data.length; i++) {
        res.add(
            ChatModel(prompt: data[i]["prompt"], answer: data[i]["answer"]));
      }

      print(res);
      return res;
    } on DioException catch (e) {
      print("Error occured whlile adding chat : $e");
      throw Exception(e);
    }
  }
}
