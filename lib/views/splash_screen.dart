import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lms/constants/const_texts.dart';
import 'package:lms/constants/textproperties.dart';
import 'package:lms/controllers/splash_controller.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> fadeAnim;

  final splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fadeAnim = Tween<double>(begin: 0, end: 1).animate(animController);

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: FadeTransition(
          opacity: fadeAnim,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                  width: 400,
                  child: Lottie.asset('assets/student with laptop.json'),
              ),
              const SizedBox(height: 20),
              Text(
                ConstantTexts.splashTitle,
                style: TextColors.splashTextStyle,
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                duration: 2000.ms,
                color: Colors.orange,),

              SizedBox(height: 10),

              Text(ConstantTexts.splashSubTitle,
                style: TextColors.splashTextStyle,
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                duration: 2000.ms,
                color: Colors.orange,),
            ],
          ),
        ),
      ),
    );
  }
}
