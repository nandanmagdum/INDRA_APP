import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class Buttons {
  static ButtonStyle outlineButtonStyle() {
    return OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor),
      padding: EdgeInsets.symmetric(vertical: 15.h),
    );
  }

  static ButtonStyle ElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      backgroundColor: primaryColor,
      // foregroundColor: secondaryColor,
      side: const BorderSide(color: primaryColor),
      padding: EdgeInsets.symmetric(vertical: 15.h),
    );
  }

  static TextField CustomTextField(
      {required String labelText,
      required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      Icon icon = const Icon(Icons.abc)}) {
    return TextField(

      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }
}
