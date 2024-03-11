import 'package:demo/test_screen.dart';
import 'package:demo/screens/FormScreens/upload_photos_screen.dart';
import 'package:demo/screens/FormScreens/where_do_you_work_screen.dart';
import 'package:demo/screens/FormScreens/your_name_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bottom_navigation_screen.dart';
import 'dob_screen.dart';
import 'gender_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _NameFormScreenState();
}

class _NameFormScreenState extends State<MainScreen> {
  List<Widget> pages = [
    YourNameScreen(),
    DobScreen(),
    GenderScreen(),
    WorkPlaceScreen(),
    UploadPhotosScreen(),
    // TestScreen(),
  ];
  Future<void> onFinished() async {
    Get.to(() => BottomNavigationScreen(),
        transition: Transition.rightToLeftWithFade);
    print('finished');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        // reverse: true,
        itemCount: 5,
        radius: 30,
        verticalPosition: 0.85,
        colors: const [
          Colors.white,
          Colors.pinkAccent,
          Colors.greenAccent,
          Colors.blueAccent,
          Colors.orangeAccent,
          // Colors.deepPurpleAccent,
          // Colors.yellowAccent,
        ],
        itemBuilder: (index) {
          return pages[index % pages.length];
        },
        onFinish: onFinished,
      ),
    );
  }
}
