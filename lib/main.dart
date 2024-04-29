import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:version1/features/MainScreen.dart/main_screen.dart';
import 'package:version1/features/auth/screens/enter_otp.dart';
import 'package:version1/features/auth/screens/enter_user_details.dart';
import 'package:version1/features/auth/splash_screen.dart';
import 'package:version1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(screenWidth, screenHeight),
        builder: (_, context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            // home: EnterUserDetails(),
          );
        });
  }
}
