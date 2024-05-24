import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/firebase_options.dart';

import 'features/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void intializer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("country", "US");
    prefs.setString("lang", "en");
  }

  @override
  void initState() {
    // TODO: implemenct initState
    intializer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(screenWidth, screenHeight),
        builder: (_, context) {
          return MaterialApp(
            theme: ThemeData(fontFamily: 'poppins'),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            // home: const MainScreen(),
            // home: EnterUserDetails(),
          );
        });
  }
}
