import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommdator extends StatefulWidget {
  const Recommdator({super.key});

  @override
  State<Recommdator> createState() => _RecommdatorState();
}

class _RecommdatorState extends State<Recommdator> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController soilTypeController = TextEditingController();
    final TextEditingController saplingTypeController = TextEditingController();
    final TextEditingController irrigationTypeTypeController =
        TextEditingController();
    return Column(
      children: [
        Expanded(
            child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          height: screenHeight,
          width: screenWidth,
          // color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "Fertilizer recommendation",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              customTextField(
                  kcontroller: soilTypeController, hintText: "Soil Type"),
              customTextField(
                  kcontroller: saplingTypeController,
                  hintText: "Type of Sapling"),
              customTextField(
                  kcontroller: irrigationTypeTypeController,
                  hintText: "Type of fertilizer"),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  print("");
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20),
                ),
              )),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Divider(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                "Best Fertilizers for your crop",
                style: smallbody(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1. Ammonium Sulphate\n2. Single Super Phospate\n3. Urea",
                style: smallbody(),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
            ],
          ),
        )),
      ],
    );
  }

  TextStyle smallbody() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);

  Padding customTextField(
          {required final TextEditingController kcontroller,
          required final hintText,
          final icon = const Icon(
            Icons.search,
            color: Color(0xFF638787),
          )}) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: kcontroller,
          onChanged: (value) {
            kcontroller.text = value;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF638787),
            ),
            fillColor: Color(0xFFD6E3E2),
            hintText: hintText,
            filled: true,
            iconColor: Color(0xFF638787),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                // color: Color(0xFFD6E3E2),
                color: Colors.transparent,
                // //   width: 2,
              ),
            ),
          ),
        ),
      );
}
