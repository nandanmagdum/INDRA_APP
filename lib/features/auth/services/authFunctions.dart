import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:version1/features/auth/welcome_screen.dart';
import 'package:version1/models/user_model.dart';
import 'package:version1/utils/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/enter_otp.dart';

class AuthFunctions {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Dio dio = Dio();

  logOut({required BuildContext context}) async {
    await firebaseAuth.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  Future<void> createUser(UserModel user) async {
    try {
      Response response = await dio.post("${base_url}auth/create", data: {
        "name": user.name,
        "phone": user.phone,
        "uuid": user.uid,
        "address": {
          "street": user.street,
          "village_city": user.village,
          "taluka": user.taluka,
          "district": user.district,
          "zip": user.zip,
          "state": user.state
        }
      });
    } catch (e) {
      print("Error ouccured while creating the user: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<bool> checkIfUserExists(String uid) async {
    try {
      Response response =
          await dio.post("${base_url}auth/check", data: {"uuid": uid});

      if (response.data == null) {
        return false;
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", uid);
        return true;
      }
    } catch (e) {
      print("Error ouccured while creating the user: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  /// This function verify the phone number
  static Future verifyPhoneNumber(
      {required String phoneNumber,
      required bool isSignUp,
      required String type,
      List<String>? userdata,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.white,
              behavior: SnackBarBehavior.floating,
              content: ListTile(
                leading: Icon(Icons.error, color: Colors.red),
                title: Text(
                  'Please enter valid phone number',
                ),
              ),
            ));
          },
          codeSent: (String verficationID, int? resendToken) {
            print("Code sent");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => EnterOTP(
                          verficationID: verficationID,
                          PhoneNumber: phoneNumber,
                          isSignUp: isSignUp,
                          type: type,
                          userdata: userdata,
                        ))));
          },
          codeAutoRetrievalTimeout: (String verification) {},
          phoneNumber: phoneNumber);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('backend Exception: ' + e.toString())));
    }
  }
}
