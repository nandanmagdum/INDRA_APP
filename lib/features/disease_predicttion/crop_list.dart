import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/features/disease_predicttion/image_screen.dart';

class CropList extends StatefulWidget {
  const CropList({super.key});

  @override
  State<CropList> createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  List<String> crops = [
    "Tomato",
    "Brinjal",
    "Chili",
    "Apple",
    "BellPepper",
    "Cherry",
    "Corn",
    "Grape",
    "Peach",
    "Potato",
    "Rice"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text("disease_prediction".tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageScreen(
                                crop: crops[index],
                              )));
                    },
                    child: customCard(
                        crops[index], "assets/images/${crops[index]}.png"),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget customCard(String cropName, String cropImage) {
  return Container(
    margin: const EdgeInsets.all(10),
    // color: Colors.lightGreen,
    decoration: BoxDecoration(
      color: Colors.grey[400],
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            offset: const Offset(2, 2),
            color: Colors.grey[100]!,
            spreadRadius: 1,
            blurRadius: 2),
        BoxShadow(
            offset: const Offset(-2, -2),
            color: Colors.grey[100]!,
            spreadRadius: 1,
            blurRadius: 2),
      ],
    ),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100, child: Image.asset(cropImage)),
        Text("${cropName}".tr,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ],
    )),
  );
}
