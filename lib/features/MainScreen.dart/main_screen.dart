import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/controllers/navigation_bar_controller.dart';
import 'package:version1/features/NavigationBar/navigation_bar.dart';
import 'package:version1/features/area_calculator/area_calculator.dart';
import 'package:version1/features/fertilizer_recommedator/fertilizer_recommedator.dart';
import 'package:version1/features/location_map/location.dart';
import 'package:version1/features/profile_page/profile_page.dart';
import 'package:version1/features/soil_type/soil_type.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarController controller = Get.find();
    return Scaffold(
      body: Obx(() => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            child: IndexedStack(
              index: controller.currentIndex.value,
              children: [
                AreaCalculator(),
                SoilType(),
                Recommdator(),
                Location(),
                ProfilePage()
              ],
            ),
          )),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
