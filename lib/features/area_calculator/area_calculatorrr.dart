
import 'answer_screen.dart';
import 'package:flutter/material.dart';

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  State<AreaCalculator> createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController plant_distance = TextEditingController();
  String lengthUnit = "meter";
  String widthUnit = "meter";
  String areaUnit = "sq_meter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Area Calculator",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Enter Area | Enter length and width"),
              // length input
              const Text("Enter Length of the field",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: length,
                      onChanged: (String value) {
                        length.text = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Length",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 150,
                    child: DropdownButton(
                        value: lengthUnit,
                        items: ["meter", "foot"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            lengthUnit = value.toString();
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // width input
              const Text("Enter Width of the field",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: width,
                      onChanged: (String value) {
                        width.text = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Width",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  DropdownButton(
                      value: widthUnit,
                      items: ["meter", "foot"]
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          widthUnit = value.toString();
                        });
                      }),
                ],
              ),
              const SizedBox(height: 30),
              // divider
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 4, color: Colors.grey)),
                  Text("  OR  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(child: Divider(thickness: 4, color: Colors.grey))
                ],
              ),
              const SizedBox(height: 10),

              // area input
              const Text("Enter Area of the field",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: area,
                      onChanged: (String value) {
                        area.text = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Area",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  DropdownButton(
                      value: areaUnit,
                      items: ["sq_meter", "sq_foot", "acre", "gunta"]
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          areaUnit = value.toString();
                        });
                      }),
                ],
              ),
              const SizedBox(height: 30),

              const Divider(thickness: 3),
              const SizedBox(height: 20),
              // plant to plant distance
              const Text("Enter plant to plant distance (mm)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),

              SizedBox(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: plant_distance,
                  onChanged: (String value) {
                    plant_distance.text = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Plant to Plant distance",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print(length.text);
                  print(width.text);
                  print(area.text);
                  print(plant_distance.text);
                  print(lengthUnit);
                  print(widthUnit);
                  print(areaUnit);
                  if (area.text != "") {
                    try {
                      double kArea = double.parse(area.text);
                      switch (areaUnit) {
                        case "sq_meter":
                          final areaInMM = kArea * 1000000;
                          final fieldLength = areaInMM / 1500;
                          try {
                            final p2p = double.parse(plant_distance.text);
                            final ANSWER = (fieldLength / p2p).toInt() * 2;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AnswerScreen(Answer: ANSWER)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Enter valid Plant to Plant Distance")));
                            return;
                          }
                          break;
                        case "sq_foot":
                          final areaInMM = kArea * 92903;
                          final fieldLength = areaInMM / 1500;
                          try {
                            final p2p = double.parse(plant_distance.text);
                            final ANSWER = (fieldLength / p2p).toInt() * 2;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AnswerScreen(Answer: ANSWER)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Enter valid Plant to Plant Distance")));
                            return;
                          }
                          break;
                        case "acre":
                          final areaInMM = kArea * 4046.86 * 1000000;
                          final fieldLength = areaInMM / 1500;
                          try {
                            final p2p = double.parse(plant_distance.text);
                            final ANSWER = (fieldLength / p2p).toInt() * 2;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AnswerScreen(Answer: ANSWER)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Enter valid Plant to Plant Distance")));
                            return;
                          }
                          break;
                        case "gunta":
                          final areaInMM = kArea * 101.1714105 * 1000000;
                          final fieldLength = areaInMM / 1500;
                          try {
                            final p2p = double.parse(plant_distance.text);
                            final ANSWER = (fieldLength / p2p).toInt() * 2;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AnswerScreen(Answer: ANSWER)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Enter valid Plant to Plant Distance")));
                            return;
                          }
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Something went wrong")));
                          return;
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please Enter valid Area")));
                    }
                  }
                  // only length and width is given
                  else if (length.text != "" || width.text != "") {
                    double lengthInMM = 0.0;
                    double widthInMM = 0.0;
                    try {
                      lengthInMM = double.parse(length.text);
                    } catch (e) {
                      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                          const SnackBar(
                              content: Text("Please Enter valid length")));
                      return;
                    }
                    try {
                      widthInMM = double.parse(width.text);
                    } catch (e) {
                      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                          const SnackBar(
                              content: Text("Please Enter valid width")));
                      return;
                    }

                    // calculate length in mm
                    if (lengthUnit == "meter") {
                      lengthInMM = lengthInMM * 1000;
                    } else if (lengthUnit == "foot") {
                      lengthInMM = lengthInMM * 304.8;
                    }
                    // calculate width in mm
                    if (lengthUnit == "meter") {
                      widthInMM = widthInMM * 1000;
                    } else if (lengthUnit == "foot") {
                      widthInMM = widthInMM * 304.8;
                    }
                    // calculate area in mm
                    final AREA_IN_MM = lengthInMM * widthInMM;
                    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
                    print("Area in MM ${AREA_IN_MM}");
                    final fieldLength = AREA_IN_MM / 1500;
                    try {
                      final p2p = double.parse(plant_distance.text);
                      final ANSWER = (fieldLength / p2p).toInt() * 2;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnswerScreen(Answer: ANSWER)));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Please Enter valid Plant to Plant Distance")));
                      return;
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter the required data")));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Calculate Number of Saplings required",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDropDown extends StatefulWidget {
  final List<String> items;
  String unit;
  MyDropDown({super.key, required this.unit, required this.items});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: widget.unit.toString(),
        items: widget.items
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            widget.unit = value.toString();
          });
        });
  }
}
