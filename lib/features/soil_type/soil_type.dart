import 'package:flutter/material.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  State<DiseasePrediction> createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController soilTypeController = TextEditingController();
    final TextEditingController saplingTypeController = TextEditingController();
    final TextEditingController fertilizerTypeController =
        TextEditingController();
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
    );
  }

  Widget customTextField(
          {required final TextEditingController kcontroller,
          required final hintText,
          final icon = const Icon(
            Icons.search,
            color: Color(0xFF638787),
          )}) =>
      TextField(
        controller: kcontroller,
        onChanged: (value) {
          kcontroller.text = value;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF638787),
          ),
          fillColor: Colors.transparent,
          hintText: hintText,
          filled: true,
          iconColor: const Color(0xFF638787),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              // color: Color(0xFFD6E3E2),
              color: Colors.transparent,
              // //   width: 2,
            ),
          ),
        ),
      );
}
