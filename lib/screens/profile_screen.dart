import 'package:flutter/material.dart';
import 'package:vikn_codes_flutter_task/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/screens/login_screen.dart';
import 'package:vikn_codes_flutter_task/widgets/bottom_nav_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const baseWidth = 430;
    const baseHeight = 932;

    final w = screenWidth / baseWidth;
    final h = screenHeight / baseHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔹 Main Card
          Positioned(
            top: 63 * h,
            left: 18 * w,
            child: Container(
              width: 388 * w,
              height: 352 * h,
              padding: EdgeInsets.symmetric(horizontal: 20 * w),
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(44 * w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(height: 40 * h),

                  /// 🔹 Profile Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// LEFT SIDE (Avatar + Name)
                      Row(
                        children: [
                          /// Avatar
                          Container(
                            width: 100 * w,
                            height: 100 * w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.circular(33 * w),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 55.86 * w,
                                height: 73.88 * h,
                                child: Image.asset(
                                  "assets/images/pngaaa 1.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 12 * w),

                          /// Name + Email
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "David Arnold",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20 * w,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4 * h),
                              Text(
                                "david012@cabzing",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14 * w,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.06 * 14 * w,
                                  color: const Color(0xFFB5CDFE),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// RIGHT SIDE (Edit Icon)
                      SizedBox(
                        width: 24 * w,
                        height: 24 * w,
                        child: Image.asset("assets/images/edit.png"),
                      ),
                    ],
                  ),

                  Container(
                    width: 352 * w,
                    height: 109 * h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // First Row (Rating)
                        SizedBox(
                          width: 170 * w,
                          height: 107 * h,

                          child: Container(
                            width: 130 * w,
                            height: 78 * h,
                            padding: EdgeInsets.symmetric(horizontal: 14 * w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.circular(33 * w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 38 * w,
                                  height: 78 * h,
                                  padding: EdgeInsets.all(
                                    10 * w,
                                  ), // padding: 10px
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFB5CDFE,
                                    ), // background
                                    borderRadius: BorderRadius.circular(
                                      111 * w,
                                    ), // pill shape
                                  ),
                                  child: SizedBox(
                                    width: 18 * w,
                                    height: 18 * h,
                                    child: Image.asset(
                                      "assets/images/stars.png",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 78 * w,
                                  // height: 57 * h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // width: 26 * w,
                                        height: 27 * h,
                                        child: Text(
                                          "4.3★",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18 * w,
                                            fontWeight: FontWeight.w400,
                                            height: 1.0, // line-height: 100%
                                            letterSpacing: 0,
                                            color:
                                                Colors
                                                    .white, // use white for blue background
                                          ),
                                        ),
                                      ),

                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "2,211",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14 * w,
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  15 / 14, // line-height: 15px
                                              letterSpacing:
                                                  -0.01 * 14 * w, // -1%
                                              color: const Color(0xFF565656),
                                            ),
                                          ),
                                          Text(
                                            "rides",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14 * w,
                                              fontWeight: FontWeight.w400,
                                              height: 15 / 14,
                                              letterSpacing: -0.01 * 14 * w,
                                              color: const Color(
                                                0xFFB5CDFE,
                                              ), // subtitle color
                                            ),
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
                        // Second Row (KYC)
                        SizedBox(
                          width: 170 * w,
                          height: 107 * h,
                          child: Container(
                            width: 130 * w,
                            height: 78 * h,
                            padding: EdgeInsets.symmetric(horizontal: 14 * w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF000000),
                              borderRadius: BorderRadius.circular(33 * w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 38 * w,
                                  height: 78 * h,
                                  padding: EdgeInsets.all(
                                    10 * w,
                                  ), // padding: 10px
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFA9C9C5,
                                    ), // background
                                    borderRadius: BorderRadius.circular(
                                      111 * w,
                                    ), // pill shape
                                  ),
                                  child: SizedBox(
                                    width: 18 * w,
                                    height: 18 * h,
                                    child: Image.asset(
                                      "assets/images/shield-tick.png",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 78 * w,
                                  // height: 57 * h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // width: 26 * w,
                                        height: 27 * h,
                                        child: Row(
                                          children: [
                                            Text(
                                              "KYC",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18 * w,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.0, // line-height: 100%
                                                letterSpacing: 0,
                                                color:
                                                    Colors
                                                        .white, // use white for blue background
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10 * w,
                                              height: 10 * h,
                                              child: Image.asset(
                                                "assets/images/Vector.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Text(
                                        "Verified",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14 * w,
                                          fontWeight: FontWeight.w400,
                                          height: 15 / 14, // line-height: 15px
                                          letterSpacing: -0.01 * 14 * w, // -1%
                                          color: const Color(0xFFA9C9C5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 331 * h,
                    left: 36 * w,
                    child: Container(
                      width: 352 * w,
                      height: 67 * h,
                      padding: EdgeInsets.fromLTRB(
                        17 * w,
                        11 * h,
                        17 * w,
                        11 * h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF040404), // background
                        borderRadius: BorderRadius.circular(
                          174 * w,
                        ), // pill shape
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 24 * w,
                            height: 24 * h,
                            child: Image.asset("assets/images/logout.png"),
                          ),

                          SizedBox(
                            width: 51 * w,
                            height: 23 * h,
                            child: Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15 * w,
                                  fontWeight: FontWeight.w400,
                                  height: 1.0, // line-height: 100%
                                  letterSpacing: 0,
                                  color: const Color(0xFFEA6262), // text color
                                ),
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
          ),

          // Positioned(
          //   top: 450 * h,
          //   left: 50 * w,
          //   child: SizedBox(
          //     width: 329 * w,
          //     height: 333 * h,
          //     child: SizedBox(
          //       width: 329 * w,
          //       height: 27 * 3 * h,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               SizedBox(
          //                 width: 77 * w,
          //                 height: 20 * h,
          //                 child: Image.asset("assets/images/badge-help.png"),
          //               ),
          //               SizedBox(
          //                 width: 39 * w,
          //                 height: 27 * h,
          //                 child: Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: Text(
          //                     "Help",
          //                     style: TextStyle(
          //                       fontFamily: 'Poppins',
          //                       fontSize: 15 * w,
          //                       fontWeight: FontWeight.w400,
          //                       height: 1.0, // line-height: 100%
          //                       letterSpacing: 0,
          //                       color: const Color(0xFFF6F6F6), // text color
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),

          //           Spacer(),
          //           SizedBox(
          //             width: 7 * w,
          //             height: 14 * h,
          //             child: Icon(Icons.arrow_forward_ios, color: Colors.white),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 450 * h,
            left: 50 * w,
            child: Column(
              children: [
                SizedBox(
                  width: 329 * w,
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 🔹 LEFT (Icon + Text)
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/badge-help.png",
                            width: 24 * w,
                            height: 24 * h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 10 * w),

                          Text(
                            "Help",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15 * w,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              color: const Color(0xFFF6F6F6),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),

                      /// 🔹 RIGHT (Arrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14 * w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 49 * h),

                SizedBox(
                  width: 329 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 🔹 LEFT (Icon + Text)
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/search-status.png",
                            width: 24 * w,
                            height: 24 * h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 10 * w),

                          Text(
                            "FAQ",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15 * w,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              color: const Color(0xFFF6F6F6),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),

                      /// 🔹 RIGHT (Arrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14 * w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 49 * h),

                SizedBox(
                  width: 329 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 🔹 LEFT (Icon + Text)
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/Add-Person.png",
                            width: 24 * w,
                            height: 24 * h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 10 * w),

                          Text(
                            "Invite Friends",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15 * w,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              color: const Color(0xFFF6F6F6),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),

                      /// 🔹 RIGHT (Arrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14 * w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 49 * h),

                SizedBox(
                  width: 329 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 🔹 LEFT (Icon + Text)
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/shield-search.png",
                            width: 24 * w,
                            height: 24 * h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 10 * w),

                          Text(
                            "Terms of Service",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15 * w,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              color: const Color(0xFFF6F6F6),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),

                      /// 🔹 RIGHT (Arrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14 * w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 49 * h),

                SizedBox(
                  width: 329 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 🔹 LEFT (Icon + Text)
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/security-safe.png",
                            width: 24 * w,
                            height: 24 * h,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 10 * w),

                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15 * w,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              color: const Color(0xFFF6F6F6),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),

                      /// 🔹 RIGHT (Arrow)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14 * w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 97 * h,
        padding: EdgeInsets.fromLTRB(43 * w, 20 * h, 43 * w, 25 * h),
        decoration: const BoxDecoration(color: Color(0xFF000000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🔹 Item 1
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (_, __, ___) => DashboardScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        // similar to "smart animate"
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              // borderRadius: BorderRadius.circular(8 * w),
              child: SizedBox(
                width: 28 * w,
                height: 28 * w,
                child: Image.asset("assets/images/home.png"),
              ),
            ),
            // SizedBox(width: 69 * w), // space between items
            // 🔹 Item 2
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        // similar to "smart animate"
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              // borderRadius: BorderRadius.circular(8 * w),
              child: SizedBox(
                width: 28 * w,
                height: 28 * w,
                child: Image.asset("assets/images/route-square.png"),
              ),
            ),
            // SizedBox(width: 69 * w), // space between items
            // 🔹 Item 3
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        // similar to "smart animate"
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              // borderRadius: BorderRadius.circular(8 * w),
              child: SizedBox(
                width: 28 * w,
                height: 28 * w,
                child: Image.asset("assets/images/notification-bing.png"),
              ),
            ),
            // SizedBox(width: 69 * w), // space between items
            // 🔹 Item 4
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        // similar to "smart animate"
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              // borderRadius: BorderRadius.circular(8 * w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 28 * w,
                    height: 28 * w,
                    child: Image.asset("assets/images/profile.png"),
                  ),
                  Container(
                    width: 7 * w,
                    height: 7 * w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle, // makes it a dot
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
