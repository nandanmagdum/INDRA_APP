import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:mutex/mutex.dart';

class ImageScreen extends StatefulWidget {
  final String crop;
  ImageScreen({super.key, required this.crop});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  Mutex m = Mutex();
  File? pickedImage;
  XFile? image;

  List? results;
  String confidence = "";
  String name = "";
  String crop_name = "";
  String disease_name = "";

  applyModelOnImage(File file) async {
    final modelStatus = await loadModel();
    print("*&*&*&&*&*&*&**&**&*&*&*&*&* ::: ${modelStatus}");
    try {
      var res = await Tflite.runModelOnImage(
          path: file.path,
          numResults: 2,
          threshold: 0.5,
          imageMean: 127.5,
          imageStd: 127.5);

      setState(() {
        results = res!;
        // print(results);
        String str = results![0]["label"];
        name = str.substring(2);
        confidence = results != null
            ? (results![0]["confidence"] * 100.0).toString().substring(0, 5) +
                "%"
            : "";
        print(name);
        print(confidence);
        split_model_result();
      });
    } catch (e) {
      print(e);
    }
  }

  void split_model_result() {
    List temp = name.split(' ');
    crop_name = temp[0];
    temp.removeAt(0);
    disease_name = temp.join(' ');
    print(crop_name);
    print(disease_name);
  }

  Future getImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        final imageTemporary = File(image!.path);
        setState(() {
          pickedImage = imageTemporary;
          applyModelOnImage(pickedImage!);
        });
      }
      print("IMAGE PICKED !!!!");
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future loadModel() async {
    try {
      var resultant = await Tflite.loadModel(
          model: "assets/models/${widget.crop}/${widget.crop}.tflite",
          labels: "assets/models/${widget.crop}/labels.txt");
      print(resultant);
      return resultant;
    } catch (e) {
      print("MODEL FAILED TO LOAD:: ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.crop}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getImage(ImageSource.gallery);
        },
        child: Text("Pick Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          image == null
              ? Text("Image not selected")
              : Image.file(File(image!.path)),
          Text("Disease: ${name}"),
          Text("confidance: ${confidence}"),
          Text("Crop: ${crop_name}"),
          Text("Disease name: ${disease_name}"),
          // ElevatedButton(
          //     onPressed: () async {
          //       await loadModel();
          //     },
          //     child: Text("Load image"))
        ],
      ),
    );
  }
}
