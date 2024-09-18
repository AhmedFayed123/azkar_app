import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:task3/features/azkar/presentation/adhkar_screen.dart';
import 'package:task3/features/settings/presentation/settings.dart';
import 'package:task3/features/tasbeeh/presentation/tasbeeh_screen.dart';

import '../main_controller/main_controller.dart';

class MainPage extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final List<Widget> pages = [
    const AdhkarScreen(),
    const TasbeehScreen(),
    const Settings(),
  ];

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return pages[bottomNavController.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return ConvexAppBar(
          style: TabStyle.reactCircle,
          backgroundColor: Colors.teal,
          activeColor: Colors.white,
          items: const [
            TabItem(icon: FlutterIslamicIcons.quran2, title: 'Home'),
            TabItem(icon: FlutterIslamicIcons.tasbih, title: 'Tasbeeh'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndex,
        );
      }),
    );
  }
}
