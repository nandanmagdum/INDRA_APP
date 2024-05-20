import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version1/features/area_calculator/area_calculatorrr.dart';
import 'package:version1/features/fertilizer_recommedator/fertilizer_recommedator.dart';
import 'package:version1/features/location_map/location_tracking_screen.dart';
import 'package:version1/features/profile_page/profile_page.dart';
import 'package:version1/features/soil_type/soil_type.dart';


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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          onTap: (index) =>
              ref.read(bottomNavigationBarProvider.notifier).state = index,
          currentIndex: ref.watch(bottomNavigationBarProvider),
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedIconTheme:
              const IconThemeData(color: Colors.grey, size: 25),
          selectedLabelStyle: const TextStyle(color: Colors.green),
          selectedIconTheme: const IconThemeData(color: Colors.green, size: 30),
          useLegacyColorScheme: false,
          backgroundColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: "Area"),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature_outlined), label: "Soil"),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_services_outlined),
                label: "Fertilizer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: "Location"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
