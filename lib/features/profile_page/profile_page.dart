import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/auth/services/authFunctions.dart';
import 'package:dio/dio.dart';
import 'package:version1/features/chatbot/gemini.dart';
import 'package:version1/features/videos/videoList.dart';
import 'package:version1/utils/api_urls.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dio = Dio();
  Future<dynamic> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwt = prefs.getString("jwt")!;

    print("fetch data function called");
    final response = await dio.get("${base_url}user",
        options: Options(headers: {'authorization': jwt}));

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => VideoList()));
                  },
                  title: Text("Informational Video"),
                  leading: Icon(Icons.video_call_sharp),
                ),
              ),
              Card(
                shadowColor: Colors.green,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GEMINI()));
                  },
                  title: Text("Chat Bot"),
                  leading: Icon(Icons.chat),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () => AuthFunctions().logOut(context: context),
                  icon: const Icon(Icons.logout_rounded)),
            )
          ],
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  "Snapshot data error",
                  style: Theme.of(context).textTheme.headlineSmall,
                ));
              } else {
                final data = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: screenWidth * 0.2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data['name'],
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.06)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        const Divider(color: Colors.black, thickness: 2),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text("Phone :  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['phone'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("Street :  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['street'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("Village/city:  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['village_city'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Text("Vehicle ID :  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text("155238", style: TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("Taluka: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['taluka'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("District :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['district'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("Pincode: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['zip'].toString(),
                                style: const TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("State: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Text(data['state'],
                                style: const TextStyle(fontSize: 15))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
