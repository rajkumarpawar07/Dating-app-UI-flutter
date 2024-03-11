import 'dart:async';

import 'package:demo/screens/FormScreens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../screens/get_started_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    gotToNextPage();
  }

  Future<void> gotToNextPage() async {
    print('get to next screen');
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const MainScreen(),
          transition: Transition.rightToLeftWithFade);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/Animation_hearts.json'),
      ),
    );
  }
}
