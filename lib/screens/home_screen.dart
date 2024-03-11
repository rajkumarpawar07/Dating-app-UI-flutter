import 'dart:convert';

import 'package:demo/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../data/content.dart';
import '../data/images_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List usersData = [];
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool _isFinished = false;

  Future initializeData() async {
    List data = user;
    setState(() {
      usersData = data;
      if (usersData.isNotEmpty) {
        for (int i = 0; i < usersData.length; i++) {
          _swipeItems.add(SwipeItem(
              content: Content(text: usersData[i]['name']),
              likeAction: () {
                _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                  content: Text("Liked "),
                  duration: Duration(milliseconds: 500),
                ));
              },
              nopeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Nope ${usersData[i]['name']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              superlikeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Superliked ${usersData[i]['name']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              onSlideUpdate: (SlideRegion? region) async {
                print("Region $region");
              }));
        } //for loop
        _matchEngine = MatchEngine(swipeItems: _swipeItems);
        isLoading = false;
      } //if
    }); // setState
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: Get.height / 2.2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.zero,
                      bottom: Radius.circular(40),
                    ),
                    color: Color(0xFFf3406f),
                  ),
                ),

                /// ----- my conatainer
                SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: Get.height / 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                height: 600,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 20,
                                        color: AppColors.kGreyColor
                                            .withOpacity(0.7)),
                                  ],
                                ),
                                child: Stack(children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          // margin: const EdgeInsets.only(
                                          //     top: 5, left: 20, right: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      usersData[index]['img']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(35))),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            _matchEngine!
                                                                .currentItem
                                                                ?.nope();
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5,
                                                                    left: 15,
                                                                    right: 15,
                                                                    bottom: 10),
                                                            decoration: const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            18))),
                                                            child: const Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.grey,
                                                                size: 35),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _matchEngine!
                                                                .currentItem
                                                                ?.like();
                                                          },
                                                          child: Container(
                                                            width: 70,
                                                            height: 70,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5,
                                                                    left: 15,
                                                                    right: 15,
                                                                    bottom: 10),
                                                            decoration: BoxDecoration(
                                                                color: colorApp,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            18))),
                                                            child: const Icon(
                                                                Icons
                                                                    .favorite_outline,
                                                                color: Colors
                                                                    .white,
                                                                size: 35),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _matchEngine!
                                                                .currentItem
                                                                ?.superLike();
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5,
                                                                    left: 15,
                                                                    right: 15,
                                                                    bottom: 10),
                                                            decoration: const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            18))),
                                                            child: const Icon(
                                                                Icons.flash_on,
                                                                color: Colors
                                                                    .orange,
                                                                size: 35),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    35),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    35)),
                                                    shape: BoxShape.rectangle,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    boxShadow: const <BoxShadow>[
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        blurRadius: 5.0,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15),
                                                            child: Text(
                                                              '${usersData[index]['name']}, ${usersData[index]['age']}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 22,
                                                                  letterSpacing:
                                                                      1.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 15),
                                                        child: const Text(
                                                          "Hi, This is Eliana Jose. Living in California, Us. Living my best life.💕✨",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                            letterSpacing: 1.2,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              color: Colors.black54,
                                            ),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellowAccent,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "Potential match",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  Positioned(
                                    right: 10,
                                    top: 45,
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(22.5),
                                        color: Colors.black54,
                                      ),
                                      child: Center(
                                        child: Text(
                                          usersData[index]['km'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])),
                          ),
                        ),
                        Positioned(
                          bottom: 140,
                          right: 10,
                          child: ClipRRect(
                            child: Container(height: 110, color: Colors.yellow),
                          ),
                        ),
                      ],
                    );
                  },
                  onStackFinished: () {
                    setState(() {
                      _isFinished = true;
                    });
                    _scaffoldKey.currentState!.showSnackBar(const SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  upSwipeAllowed: true,
                  fillSpace: true,
                ),
                _isFinished
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Lottie.asset(
                              'assets/animations/Animation_fox.json',
                              height: 200,
                            ),
                            const Text(
                              'OOPs!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const Text(
                              'Looks like you made it to the end.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onTap;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 12, color: AppColors.kWhiteColor),
            ),
          )),
    );
  }
}

class AppColors {
  static const kPrimaryColor = Color(0xffF3516A);
  static const kGreyColor = Color(0xff8e94a3);
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kTransparentColor = Colors.transparent;
  static const kBackroundColor = Color(0xffFFE7E3);
}
