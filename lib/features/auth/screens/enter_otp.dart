import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/features/auth/screens/enter_user_details.dart';
import 'package:version1/features/auth/services/authFunctions.dart';
import 'package:version1/features/languages/language_translators.dart';

import '../../../utils/button_style.dart';
import '../../../utils/colors.dart';
import '../../MainScreen.dart/main_screen.dart';

class EnterOTP extends StatefulWidget {
  final String verficationID;
  final List<String>? userdata;
  final String PhoneNumber;
  final bool isSignUp;
  final String type;
  const EnterOTP(
      {super.key,
      this.userdata,
      required this.verficationID,
      required this.PhoneNumber,
      required this.isSignUp,
      required this.type});
  @override
  State<EnterOTP> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterOTP> {
  bool isLoading = false;
  String myOTP = "";

  final defaultPinTheme = PinTheme(
    width: 40,
    height: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                "otp_verification".tr,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "otp_msg".tr + " ${widget.PhoneNumber}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: primaryColor),
                      ),
                    ),
                    onCompleted: (pin) => myOTP = pin,
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              // Row(
              //   children: [
              //     Text("otp_not_got".tr),
              //     GestureDetector(
              //         onTap: (() {}),
              //         child: const Text("Click to resend",
              //             style: TextStyle(color: Colors.blue)))
              //   ],
              // ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () async {
                  setState(() => isLoading = true);
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verficationID,
                            smsCode: myOTP);
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then(
                      (value) async {
                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        String phone =
                            FirebaseAuth.instance.currentUser!.phoneNumber!;
                        bool isPresent =
                            await AuthFunctions().checkIfUserExists(uid);

                        if (isPresent) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnterUserDetails(
                                      phoneNumber: phone, uid: uid)));
                        }
                      },
                    );
                  } catch (e) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final error_msg = await LanguageTranslators.tranlate(
                        input: e.toString(),
                        sourceLanguage: "en",
                        targetLanguage: prefs.getString("lang").toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error : " + error_msg)));
                  }
                  setState(() => isLoading = false);
                },
                style: Buttons.ElevatedButtonStyle(),
                child: (isLoading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Text("continue".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget CustomInput({required BuildContext context}) {
  return Container(
    height: 10.h,
    width: 20.w,
    decoration: BoxDecoration(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      // onEditingComplete: () {
      //   FocusScope.of(context).previousFocus(); // Move to previous field
      // },
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(border: InputBorder.none),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}
