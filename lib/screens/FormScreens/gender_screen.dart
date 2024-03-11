import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GenderScreen extends StatelessWidget {
  final _controller = Get.put(PersonalDataPageController());
  GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<int, Color> kPrimaryPurple = {
      100: Color(0xFFC4B1F8),
      80: Color(0xFFD2C4F6),
      50: Color(0xFFDED6F4),
      20: Color(0xFFF2EEFC)
    };
    const Map<int, Color> kPrimaryPink = {
      100: Color(0xFFFDB1D5),
      80: Color(0xFFFFD4E9),
      50: Color(0xFFFFEAF4),
      20: Color(0xFFFFF5FA)
    };
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight),
          const Text("What's your gender?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black)),
          const SizedBox(height: 50),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BouncingWidget(
                    onPressed: () {
                      _controller.gender.value = "Male";
                    },
                    duration: const Duration(milliseconds: 200),
                    scaleFactor: 2,
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: _controller.gender.value == "Male"
                              ? kPrimaryPurple[100]
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  "assets/images/male-symbol.svg",
                                  color: _controller.gender.value == "Male"
                                      ? Colors.white
                                      : kPrimaryPurple[100],
                                ),
                              ),
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _controller.gender.value == "Male"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BouncingWidget(
                    onPressed: () {
                      _controller.gender.value = "Female";
                    },
                    duration: Duration(milliseconds: 200),
                    scaleFactor: 2,
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: _controller.gender.value == "Female"
                              ? kPrimaryPink[100]
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/images/female-symbol.svg",
                                color: _controller.gender.value == "Female"
                                    ? Colors.white
                                    : kPrimaryPink[100],
                              ),
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _controller.gender.value == "Female"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }
}

class PersonalDataPageController extends GetxController {
  Rx<String> gender = ''.obs;
}
