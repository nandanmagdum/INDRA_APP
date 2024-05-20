import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoilType extends StatefulWidget {
  const SoilType({super.key});

  @override
  State<SoilType> createState() => _SoilTypeState();
}

class _SoilTypeState extends State<SoilType> {
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
        title: Text("Soil Type",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              // Text(
              //   "Soil Type",
              //   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: screenHeight * 0.01),
              customTextField(
                  kcontroller: soilTypeController, hintText: "Soil Type"),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: saplingTypeController,
                  hintText: "Type of Sapling"),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: fertilizerTypeController,
                  hintText: "Type of fertilizer"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              const Divider(),
              SizedBox(height: screenHeight * 0.05),
              Text("Time of harvest : 19-Nov-2023", style: smallbody()),
              SizedBox(height: screenHeight * 0.01),
              Text("Crop Yield: 100 kg", style: smallbody()),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle smallbody() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);

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
