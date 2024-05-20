import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    // final screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController soilTypeController = TextEditingController();
    final TextEditingController saplingTypeController = TextEditingController();
    final TextEditingController irrigationTypeTypeController =
        TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("Fertilizer recommendation",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30.sp,
                overflow: TextOverflow.clip)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              SizedBox(height: screenHeight * 0.01),
              customTextField(
                  kcontroller: soilTypeController, hintText: "Soil Type"),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: saplingTypeController, hintText: "Type of Sapling"),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: irrigationTypeTypeController,
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
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Divider(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                "Best Fertilizers for your crop",
                style: smallbody(),
              ),
              const SizedBox(
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
