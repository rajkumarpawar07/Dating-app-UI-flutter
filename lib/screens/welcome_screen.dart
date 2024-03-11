import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:demo/screens/registerwith_phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://player.vimeo.com/external/553348414.sd.mp4?s=727abcd8c4fef5ce52d035d6583965c014d8b2c8&profile_id=165&oauth2_token_id=57447761'))
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
        _controller.play(); // Play the video
        _controller.setLooping(true); // Loop the video
      });
  }

  final double videoOpacity = 0.1; // Set the opacity level here
  bool _showSocialMediabuttons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _controller.value.isInitialized
              ? BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 2, sigmaY: 2), // Apply blur to the video
                  child: AspectRatio(
                    aspectRatio: 0.2,
                    child: VideoPlayer(_controller),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.8), // Adjust the opacity as needed
                ],
              ),
            ),
          ),

          Column(
            children: [
              Lottie.asset(
                'assets/animations/Animation_hearts.json',
              ),
            ],
          ),
          // Your UI overlay goes here
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dating App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                'Welcome To Dating App!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.4), // For spacing

              // Add your terms of service text here
            ],
          ),
          Positioned(
            bottom: kToolbarHeight - 20,
            left: 10,
            right: 10,
            child: Column(
              children: [
                _showSocialMediabuttons
                    ? FadeInUp(
                        delay: const Duration(milliseconds: 50),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  // Handle create account action
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30, // Set the radius here
                                      child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF395693),
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  // Handle create account action
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30, // Set the radius here
                                      child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/480px-Facebook_Logo_%282019%29.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Sign in with Facebook',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF7C376D),
                                  shadowColor: Colors.transparent,

                                  // shape: Border.all(),
                                ),
                                onPressed: () {
                                  // Handle create account action
                                },
                                child: const Text(
                                  'Sign in with phone number',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7C376D),
                            shadowColor: Colors.transparent,

                            // shape: Border.all(),
                          ),
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                _isLoading = false;
                              });

                              Get.to(() => const RegisterWithPhoneNumber(),
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
                                  'Create account',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    // Handle sign in action
                    setState(() {
                      _showSocialMediabuttons = !_showSocialMediabuttons;
                    });
                  },
                  child: Text(
                    _showSocialMediabuttons ? 'Back' : 'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when the widget is disposed
  }
}
