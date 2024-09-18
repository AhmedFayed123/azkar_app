import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/main_page/presentation/main_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.off(()=>MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'أذكارى',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50,),
            CircularProgressIndicator(color: Colors.white),
            // Optional: Loading indicator
          ],
        ),
      ),
    );
  }
}
