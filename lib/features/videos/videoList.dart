import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/videos/videoScreen.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  Dio dio = Dio();
  Future<dynamic> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("jwt")!;
    try {
      final response = await dio.get(
          "https://indra-backend-cxg7.onrender.com/video/all",
          options: Options(headers: {"Authorization": token}));
      print("********** ${response.data}");
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        throw Exception("exception");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        throw Exception("exception");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      throw Exception("exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informational Videos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error getting data from api"),
              );
            } else if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                    videoData: snapshot.data[index],
                                    video_id: snapshot.data[index]['video_id'],
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.amber[100],
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              "https://img.youtube.com/vi/${snapshot.data[index]['video_id']}/sddefault.jpg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(snapshot.data[index]['title']),
                          SizedBox(
                            height: 10,
                          ),
                          Text(snapshot.data[index]['description']),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Some unknown error occured !"),
              );
            }
          },
        ),
      ),
    );
  }
}
