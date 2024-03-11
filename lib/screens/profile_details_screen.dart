import 'package:demo/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../data/images_data.dart';
import 'home_screen.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final User user;
  final VoidCallback onBack;
  const ProfileDetailsScreen(
      {super.key, required this.user, required this.onBack});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  List<String> Hobbies = [
    "Astronomy",
    "Chess",
    "Trekking",
    "Cycling",
    "Parkour"
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
                height: 740,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: AppColors.kGreyColor.withOpacity(0.7)),
                  ],
                ),
                child: Stack(children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: NetworkImage(widget.user.image),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35))),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            margin: const EdgeInsets.only(
                                                top: 5,
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18))),
                                            child: const Icon(Icons.close,
                                                color: Colors.grey, size: 35),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            margin: const EdgeInsets.only(
                                                top: 5,
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                                color: colorApp,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(18))),
                                            child: const Icon(
                                                Icons.favorite_outline,
                                                color: Colors.white,
                                                size: 35),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            margin: const EdgeInsets.only(
                                                top: 5,
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18))),
                                            child: const Icon(Icons.flash_on,
                                                color: Colors.orange, size: 35),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35)),
                                    shape: BoxShape.rectangle,
                                    color: Colors.black.withOpacity(0.7),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            // margin:
                                            //     const EdgeInsets.only(left: 15),
                                            child: Text(
                                              '${widget.user.name} , 28',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Iconsax.location5,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Pune, Maharashtra",
                                            style: TextStyle(
                                                letterSpacing: 1.1,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "Hi, This is Eliana Jose. Living my best life. and my best part is...",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22.5),
                                                color: Colors.grey,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  Hobbies[index],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              width: 5,
                                            );
                                          },
                                        ),
                                      )
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
                      left: 10,
                      top: kToolbarHeight - 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          widget
                              .onBack(); // Call the callback when the button is pressed
                        },
                      )),
                ])),
          ),
        ),
        // Positioned(
        //   bottom: 140,
        //   right: 10,
        //   child: ClipRRect(
        //     child: Container(height: 110, color: Colors.yellow),
        //   ),
        // ),
      ],
    );
  }
}
