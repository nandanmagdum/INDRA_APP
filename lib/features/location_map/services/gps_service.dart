import 'package:dio/dio.dart';

class GPSservice {
  final String gps_url =
      "https://blr1.blynk.cloud/external/api/get?token=v_vItH45ESmcLEc_nPQ74cDP8LKL2joH&V1&V2";
  Dio dio = Dio();

  Future<dynamic> getGPSLocation() async {
    print("getGPSLocation fucntion is called");
    try {
      Response response = await dio.get(gps_url);
      print("Response : ${response.data}");
      return response.data;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
