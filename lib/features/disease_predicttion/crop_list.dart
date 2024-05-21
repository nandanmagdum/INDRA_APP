import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:version1/features/disease_predicttion/image_screen.dart';
import 'package:version1/utils/colors.dart';

class CropList extends StatefulWidget {
  const CropList({super.key});

  @override
  State<CropList> createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  List<String> crops = [
    "Apple",
    "BellPepper",
    "Cherry",
    "Corn",
    "Grape",
    "Peach",
    "Potato",
    "Rice",
    "Tomato"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("Disease Prediction",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: crops.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImageScreen(
                              crop: crops[index],
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.lightGreen,
                    child: Center(
                        child: Text(
                      "${crops[index]}",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
