import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/authFunctions.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({Key? key});

  // Constructor for when no data is passed
  const EnterPhoneNumber.noData({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  bool isLoading = false;
  PhoneNumber number = PhoneNumber(dialCode: '+91');

  void toggleLoading() {
    setState(() => isLoading = !isLoading);
  }

// 8180097590
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Please enter the mobile number to get the verification code",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 50.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: Colors.grey.shade200)],
                ),
                child: InternationalPhoneNumberInput(
                    initialValue: PhoneNumber(isoCode: "IN"),
                    inputDecoration: const InputDecoration(
                        hintText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 20)),
                    onInputChanged: (PhoneNumber phoneNumber) {
                      number = phoneNumber;
                      print(phoneNumber);
                    }),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () async {
                  toggleLoading();
                  try {
                    await AuthFunctions.verifyPhoneNumber(
                        phoneNumber: number.phoneNumber.toString(),
                        isSignUp: false,
                        type: "Login",
                        context: context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Enter Phone error : ' + e.toString())));
                  }
                  toggleLoading();
                },
                child: Center(
                  child: (isLoading)
                      ? const CircularProgressIndicator()
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
