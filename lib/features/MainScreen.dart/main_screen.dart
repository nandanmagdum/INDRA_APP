import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version1/features/area_calculator/area_calculator.dart';
import 'package:version1/features/fertilizer_recommedator/fertilizer_recommedator.dart';
import 'package:version1/features/location_map/location_tracking_screen.dart';
import 'package:version1/features/profile_page/profile_page.dart';
import 'package:version1/features/soil_type/soil_type.dart';

import '../../utils/colors.dart';

final bottomNavigationBarProvider = StateProvider((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(bottomNavigationBarProvider),
        children: const [
          AreaCalculator(),
          SoilType(),
          Recommdator(),
          LocationTracking(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            ref.read(bottomNavigationBarProvider.notifier).state = index,
        currentIndex: ref.watch(bottomNavigationBarProvider),
        selectedItemColor: Colors.black,
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
      ),
    );
  }
}
