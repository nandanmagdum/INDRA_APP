import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../utils/button_style.dart";
import "screens/enter_phone.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 70.h),
                const Image(image: AssetImage("assets/app_logo.jpg")),
                SizedBox(height: 20.h),
                const Text(
                  "Team INDRA App",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                // OutlinedButton(
                //     onPressed: () {},
                //     style: Buttons.outlineButtonStyle(),
                //     child: const Center(child: Text("Login"))),
                SizedBox(height: 10.h),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EnterPhoneNumber.noData()));
                    },
                    style: Buttons.ElevatedButtonStyle(),
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}