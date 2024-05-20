import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:version1/features/MainScreen.dart/main_screen.dart';
import 'package:version1/features/auth/services/authFunctions.dart';
import 'package:version1/models/user_model.dart';

import '../../../utils/button_style.dart';

// ignore: must_be_immutable
class EnterUserDetails extends StatefulWidget {
  String phoneNumber, uid;
  EnterUserDetails({required this.phoneNumber, required this.uid, super.key});
  @override
  State<EnterUserDetails> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterUserDetails> {
  storeDetails({required}) {}

  TextEditingController nameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              const Text(
                "Enter User Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'Name',
                  controller: nameController,
                  icon: const Icon(Icons.person)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'Street',
                  controller: streetController,
                  icon: const Icon(Icons.roundabout_left_rounded)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'Village',
                  controller: villageController,
                  icon: const Icon(Icons.location_history)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'Taluka',
                  controller: talukaController,
                  icon: const Icon(Icons.location_history)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'District',
                  controller: districtController,
                  icon: const Icon(Icons.location_history)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'Zip',
                  controller: zipController,
                  icon: const Icon(Icons.numbers_rounded)),
              SizedBox(height: 10.h),
              Buttons.CustomTextField(
                  labelText: 'State',
                  controller: stateController,
                  icon: const Icon(Icons.map)),
              SizedBox(height: 20.h),
              ElevatedButton(
                  style: Buttons.ElevatedButtonStyle(),
                  onPressed: () async {
                    UserModel user = UserModel(
                      name: nameController.text.trim(),
                      district: districtController.text.trim(),
                      phone: widget.phoneNumber,
                      state: stateController.text.trim(),
                      street: streetController.text.trim(),
                      taluka: talukaController.text.trim(),
                      uid: widget.uid,
                      village: villageController.text.trim(),
                      zip: int.parse(zipController.text.trim()),
                    );

                    await AuthFunctions().createUser(user);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  child: (isLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(
                          child: Text("Proceed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))),
            ],
          ),
        ),
      ),
    ));
  }
}
