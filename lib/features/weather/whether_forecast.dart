import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'weather.dart';

class WheatherForecast extends StatelessWidget {
  WheatherForecast({super.key});
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Wheather Forecast"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: WeatherForecastServices()
                .getData("19.39501850100153", "2074.64064993733906"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SpinKitFadingCircle(
                  color: Colors.amberAccent,
                );
              } else {
                if (snapshot.hasData) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 250),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          snapshot.data["forecast"]["forecastday"].length,
                      itemBuilder: (context, index) {
                        print(
                            "priting... ${snapshot.data["forecast"]["forecastday"][index]["day"]["condition"]["icon"]}");
                        return customCard(
                          "https:${snapshot.data["forecast"]["forecastday"][index]["day"]["condition"]["icon"]}",
                          snapshot.data["forecast"]["forecastday"][index]["day"]
                              ["condition"]["text"],
                          snapshot.data["forecast"]["forecastday"][index]["day"]
                                  ["maxtemp_c"]
                              .toString(),
                          snapshot.data["forecast"]["forecastday"][index]["day"]
                                  ["mintemp_c"]
                              .toString(),
                          snapshot.data["forecast"]["forecastday"][index]["day"]
                                  ["avgtemp_c"]
                              .toString(),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text("No data");
                }
              }
            },
          )
        ],
      ),
    );
  }

  Widget customCard(
      String imgUrl, String status, String maxi, String mini, avg) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.network(imgUrl, scale: 0.6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Status: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("Max temp: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("Min temp: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("Avg temp: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(status,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  Text(maxi,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  Text(mini,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  Text("$avg",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
