import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/loading_screen.dart';

class EmailOTPScreen extends StatefulWidget {
  const EmailOTPScreen({super.key});

  @override
  State<EmailOTPScreen> createState() => _EmailOTPScreenState();
}

class _EmailOTPScreenState extends State<EmailOTPScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background(2).png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 30,
                  width: 80,
                  height: 200,
                  child: FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      )),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      )),
                ),
                Positioned(
                  left: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      )),
                ),
              ],
            ),
          ),
          FadeInUp(
              child: Container(
            height: 400,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            child: Column(
              children: [
                FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      "Verification",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeIn(
                  delay: Duration(milliseconds: 500),
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "Please enter the 4 digit code sent to \n pawarrajkumar0707@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.shade500, height: 1.5),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Verification Code Input
                FadeInDown(
                  delay: Duration(milliseconds: 600),
                  duration: Duration(milliseconds: 500),
                  child: VerificationCode(
                    length: 4,
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    underlineColor: Colors.black,
                    keyboardType: TextInputType.number,
                    underlineUnfocusedColor: Colors.black,
                    onCompleted: (value) {},
                    onEditing: (value) {},
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 700),
                  duration: Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't revise the OTP?",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Resend",
                            style: TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeIn(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 200),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7C376D),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });

                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              _isLoading = false;
                            });

                            Get.to(() => const LoadingScreen(),
                                transition: Transition.rightToLeftWithFade);
                          });
                        },
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "Verify",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                      ),
                    )),
              ],
            ),
          )),
        ]))));
  }
}
