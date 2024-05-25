import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite/tflite.dart';
import 'package:mutex/mutex.dart';
import 'package:version1/features/languages/language_translators.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final modelStatus = await loadModel();
    print("*&*&*&&*&*&*&**&**&*&*&*&*&* ::: $modelStatus");
    try {
      var res = await Tflite.runModelOnImage(
          path: file.path,
          numResults: 2,
          threshold: 0.5,
          imageMean: 127.5,
          imageStd: 127.5);

      setState(() async{
        results = res!;
        // print(results);
        String str = results![0]["label"];
        name = str.substring(2);
        // convert to local
        final Tname = await LanguageTranslators.tranlate(input: name, sourceLanguage: "en", targetLanguage: prefs.getString("lang").toString());
        name = Tname.text;
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

  void split_model_result() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List temp = name.split(' ');
    crop_name = temp[0];
    // convert
    final Tname = await LanguageTranslators.tranlate(input: crop_name, sourceLanguage: "en", targetLanguage: prefs.getString("lang").toString());
    crop_name = Tname.text;
    temp.removeAt(0);
    disease_name = temp.join(' ');
    // convert
    final Dname = await LanguageTranslators.tranlate(input: disease_name, sourceLanguage: "en", targetLanguage: prefs.getString("lang").toString());
    disease_name = Dname.text;
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text("${widget.crop}".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),

      // floatingActionButton: FloatingActionButton(
      //     onPressed: () async => getImage(ImageSource.gallery),
      //     child: const Text("Pick Image")),
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Center(
                  child: GestureDetector(
                    onTap: () => getImage(ImageSource.gallery),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(4, 4),
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 10),
                          BoxShadow(
                              offset: Offset(-4, -4),
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 10),
                        ],
                      ),
                      child: image == null
                          ? Center(
                              child: Text("tap_to_select_image".tr,
                                  style: TextStyle(fontSize: 20)))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(File(image!.path))),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Text("crop_details".tr,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: image == null
                      ? Center(
                          child:
                              Text("unknown".tr, style: TextStyle(fontSize: 17)))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Text("disease".tr + " :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                Text(name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 18))
                              ],
                            ),
                            Wrap(children: [
                              Text("confidance".tr + ": ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                              Text(confidence,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 18))
                            ]),
                            Wrap(children: [
                              Text("crop".tr + ": ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                              Text(crop_name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 18))
                            ]),
                            Wrap(children: [
                              Text("dis_name".tr + ": ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                              Text(disease_name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 18))
                            ]),
                          ],
                        ),
                ),
                // ElevatedButton(
                //     onPressed: () async {
                //       await loadModel();
                //     },
                //     child: Text("Load image"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
