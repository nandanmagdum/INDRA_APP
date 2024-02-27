import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  State<AreaCalculator> createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var area = 0.0;
    var alley_num = 0;
    var sapling_num = 0;
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController breadthController = TextEditingController();
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
                "Area Calculator",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              customTextField(
                  kcontroller: lengthController, hintText: "Length"),
              customTextField(
                  kcontroller: breadthController, hintText: "Breadth"),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  print("${lengthController.text}, ${breadthController.text}");
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Calculate", style: TextStyle(fontSize: 20)),
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
                "Area: ${area = 0.0} sq m",
                style: smallbody(),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "Number of Alley: ${alley_num = 0}",
                style: smallbody(),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "Number of Sapling: ${sapling_num = 0} ",
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
