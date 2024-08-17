import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:learning_management_systemo_v01/screens/login.dart';
import 'package:lottie/lottie.dart';

import '../constant/Routes.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using GetX to handle splash screen duration and navigation
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() =>  LoginScreen()); // Navigates to LoginScreen and removes SplashScreen from the stack
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: splashScreenAnimation(),
      ),
    );
  }

  Container splashScreenAnimation() {
    return Container(
      color: const Color.fromARGB(0, 100, 98, 98),
      width: Get.width * 0.65, // Get.width automatically handles screen size
      height: Get.height * 0.65, // Get.height automatically handles screen size
      child: LottieBuilder.asset(
        'assets/animation/splash.json',
        fit: BoxFit.contain,
      ),
    );
  }
}
