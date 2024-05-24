import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:version1/features/fertilizer_recommedator/fertilizer_serivces.dart';
import 'package:version1/utils/colors.dart';

// final cropProvider = StateProvider<String>((ref) => "Tomato");

final fertilizerServiceProvider =
    Provider<FertilizerService>((ref) => FertilizerService());

class Recommdator extends StatefulWidget {
  const Recommdator({super.key});

  @override
  State<Recommdator> createState() => _RecommdatorState();
}

class _RecommdatorState extends State<Recommdator> {
  final TextEditingController nitrogenController = TextEditingController();
  final TextEditingController potassiumController = TextEditingController();
  final TextEditingController phosphorousController = TextEditingController();
  String crop = "Tomato";
  List<String> cropTypes = [
    "Tomato",
    "Chili",
    "Brinjal",
    "Rice",
    "Jowar(Sorghum)",
    "Barley(JAV)"
  ];

  final _controller = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("Fertilizer recommendation",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30.sp,
                overflow: TextOverflow.clip)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 40,

                  iconEnabledColor: Colors.grey,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.blueGrey[100],
                  hint: const Text("Soil Type"),
                  padding: const EdgeInsets.all(0),
                  // padding: const EdgeInsets.all(10),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(12),
                  value: crop,
                  items: cropTypes.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    crop = newValue!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: nitrogenController,
                  hintText: "Nitrogen",
                  icon: const Icon(Icons.gas_meter)),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: potassiumController,
                  hintText: "Potassium",
                  icon: const Icon(Icons.gas_meter_rounded)),
              const SizedBox(height: 20),
              customTextField(
                  kcontroller: phosphorousController,
                  hintText: "Phosphorous",
                  icon: const Icon(Icons.gas_meter)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  // FertilizerService().predictFertilizer(
                  //   ref.read(cropProvider.notifier).state,
                  //   int.parse(nitrogenController.text),
                  //   int.parse(potassiumController.text),
                  //   int.parse(phosphorousController.text),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text("Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              const Divider(),
              SizedBox(height: screenHeight * 0.05),
              if (nitrogenController.text.isNotEmpty &&
                  phosphorousController.text.isNotEmpty &&
                  potassiumController.text.isNotEmpty)
                SizedBox(
                  child: FutureBuilder(
                      future: FertilizerService().predictFertilizer(
                        crop,
                        int.parse(nitrogenController.text),
                        int.parse(potassiumController.text),
                        int.parse(phosphorousController.text),
                      ),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SpinKitCircle(color: primaryColor);
                        } else if (snapshot.hasError) {
                          return const Text("Error!");
                        } else {
                          print("************ ${snapshot.data}");
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                      snapshot.data["recommendation"]["message"]
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ListView.builder(
                                    shrinkWrap: true,

                                    itemCount: snapshot
                                        .data["recommendation"]["suggestions"]
                                        .length,
                                    // itemCount: 10,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          child: ListTile(
                                        title: Text(
                                            snapshot.data["recommendation"]
                                                ["suggestions"][index]),
                                      ));
                                    },
                                  ),
                                )
                              ],
                            );
                          } else {
                            return const Text("No data");
                          }
                        }
                      }),
                )
            ],
          ),
        ),
      ),
    );
  }

  String? validateNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a value.';
    }
    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number.';
    }
    if (number > 60) {
      return 'Value must be less than or equal to 60.';
    }
    return null; // Input is valid, no error message
  }

  Widget customTextField(
          {required final TextEditingController kcontroller,
          required final hintText,
          required final icon}) =>
      TextFormField(
        controller: kcontroller,
        onChanged: (value) {
          kcontroller.text = value;
          _errorMessage = validateNumber(value);
        },
        // maxLength: 2,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a value.';
          }
          int number = int.parse(value);
          if (number < 60) {
            return 'Please enter a valid number.';
          }
          return null; // Input is valid
        },

        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: hintText,
          errorText: _errorMessage, // Display error message if any

          prefixIcon: icon,
          fillColor: Colors.transparent,
          hintText: "Enter a nujmber (max 60)",
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
