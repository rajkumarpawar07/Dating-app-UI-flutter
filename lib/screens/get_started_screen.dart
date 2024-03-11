import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'FormScreens/main_screen.dart';
import 'email_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-james-wheeler-414612.jpg&fm=jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          FadeInDown(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Welcome to the App! \nLet\'s start with your basic information.',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Lottie.asset('assets/animations/Animation_welcome5.json'),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 6,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const EmailScreen(),
                    transition: Transition.rightToLeftWithFade);
              },
              child: FadeInUp(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Colors.white,
                  child: const Center(
                      child: Text(
                    'Start your journey',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                ),
              ),
            ),
          ),
          // Add other widgets on top of the image and gradient if needed
        ],
        // ), Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: NetworkImage(
        //               'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-james-wheeler-414612.jpg&fm=jpg'),
        //           fit: BoxFit.cover)),
        //   child: Container(
        //     padding: EdgeInsets.all(24),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Welcome to Dating App \n Let\'s start with your basic infromation',
        //           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //
        //       /// thank you text
        //       /// Lottie
        //       /// fill basic details
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
