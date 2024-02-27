import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:version1/constants/colors.dart';
import 'package:version1/controllers/navigation_bar_controller.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarController controller = Get.find();
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.setIndex(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calculate_outlined,
                  color: AppColors.bottom_navigation_bar_icon_color,
                ),
                label: "Area"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.nature_outlined,
                  color: AppColors.bottom_navigation_bar_icon_color,
                ),
                label: "Soil"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_services_outlined,
                  color: AppColors.bottom_navigation_bar_icon_color,
                ),
                label: "Fertilizer"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.bottom_navigation_bar_icon_color,
                ),
                label: "Location"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: AppColors.bottom_navigation_bar_icon_color,
                ),
                label: "Profile"),
          ],
        ));
  }
}
