import 'dart:ui';

import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
//   int selectedItem = 0;
//
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const SearchScreen(),
//     const ProfileScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           /// GridView
//           _screens[selectedItem],
//
//           /// Custom Bottom Navigation Bar
//           Positioned(
//             bottom: 18,
//             left: 18,
//             right: 18,
//             height: 86,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2, color: Colors.grey),
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(24),
//                     topLeft: Radius.circular(24),
//                     bottomLeft: Radius.circular(52),
//                     bottomRight: Radius.circular(52)),
//                 color: Colors.grey.withOpacity(0.1),
//               ),
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(24),
//                     topLeft: Radius.circular(24),
//                     bottomLeft: Radius.circular(52),
//                     bottomRight: Radius.circular(52)),
//                 child: ClipPath(
//                   // clipper: MyCustomClipper(),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
//                     child: Container(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           /// Bottom Navigation bar items
//           Positioned(
//               bottom: 18,
//               left: 22,
//               right: 22,
//               height: 86,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   _buildBNBItem(
//                       selectedItem == 0 ? Iconsax.heart5 : Iconsax.heart5, 0),
//                   _buildBNBItem(
//                       selectedItem == 1 ? Icons.search : Icons.search_rounded,
//                       1),
//                   _buildBNBItem(
//                       selectedItem == 2
//                           ? Icons.person
//                           : Icons.person_outline_rounded,
//                       2),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBNBItem(IconData icon, index) {
//     return ZoomTapAnimation(
//       onTap: () {
//         setState(() {
//           selectedItem = index;
//         });
//       },
//       child: Icon(
//         icon,
//         color: selectedItem == index ? Color(0xFFf3406f) : Colors.white,
//         size: 30,
//       ),
//     );
//   }
// }
//
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(64, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }
  var currentIndex = 0;
  List<IconData> listOfIcons = [
    Iconsax.heart5,
    Icons.search,
    Icons.person_rounded,
  ];
  List<String> listOfStrings = [
    'Explore',
    'Search',
    'Account',
  ];
  List listOfPages = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Color(0xFFf3406f),
      //     title: currentIndex == 0
      //         ? const Icon(Icons.menu, color: Colors.black87)
      //         : const Text(
      //             "Explore",
      //             style: TextStyle(color: Colors.black87),
      //           ),
      //     actions: [
      //       IconButton(
      //           splashRadius: 22,
      //           onPressed: () {},
      //           icon:
      //               const Icon(Icons.favorite_outline, color: Colors.black87)),
      //     ]),
      // body: const Center(child: Text("Index")),
      body: listOfPages.elementAt(currentIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.12),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                print(currentIndex);
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.pinkAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style: const TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.pinkAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
