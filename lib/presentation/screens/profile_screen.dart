import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/login_screen.dart';
import 'package:vikn_codes_flutter_task/widgets/bottom_nav_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 TOP CARD
            Padding(
              padding: EdgeInsets.only(
                left: 18 * w,
                top: 63 * w,
                right: 18 * w,
              ),
              child: Container(
                padding: EdgeInsets.all(20 * w),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F0F0F),
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Column(
                  children: [
                    /// PROFILE ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            /// AVATAR
                            Container(
                              width: 100 * w,
                              height: 100 * w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/pngaaa 1.png",
                                  width: 55 * w,
                                ),
                              ),
                            ),

                            SizedBox(width: 14 * w),

                            /// NAME
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "David Arnold",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20 * w,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "david012@cabzing",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14 * w,
                                    color: const Color(0xFFB5CDFE),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.06 * 14 * w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Image.asset("assets/images/edit.png", width: 24),

                        SizedBox(width: 6 * w),
                      ],
                    ),

                    SizedBox(height: 20 * w),

                    /// 🔹 STATS ROW
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _statCard(
                            icon: "assets/images/stars.png",
                            title: "4.3★",
                            subtitle1: "2,211",
                            subtitle2: "rides",
                            bg: const Color(0xFFB5CDFE),
                            showTick: false,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _statCard(
                            icon: "assets/images/shield-tick.png",
                            title: "KYC",
                            subtitle1: "Verified",
                            subtitle2: "",
                            bg: const Color(0xFFA9C9C5),
                            showTick: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    /// 🔹 LOGOUT BUTTON
                    Container(
                      height: 67,
                      decoration: BoxDecoration(
                        color: const Color(0xFF040404),
                        borderRadius: BorderRadius.circular(174),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logout.png", width: 24),
                          const SizedBox(width: 10),
                          const Text(
                            "Logout",
                            style: TextStyle(color: Color(0xFFEA6262)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            /// 🔹 MENU LIST
            _menuItem("assets/images/badge-help.png", "Help"),
            _menuItem("assets/images/search-status.png", "FAQ"),
            _menuItem("assets/images/Add-Person.png", "Invite Friends"),
            _menuItem("assets/images/shield-search.png", "Terms of Service"),
            _menuItem("assets/images/security-safe.png", "Privacy Policy"),

            const Spacer(),
          ],
        ),
      ),

      /// 🔹 BOTTOM NAV
  bottomNavigationBar: bottomNav(context, w, 3),
    );
  }

  /// 🔹 STAT CARD
  static Widget _statCard({
    required String icon,
    required String title,
    required String subtitle1,
    required String subtitle2,
    required Color bg,
    bool showTick = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 78,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(icon, width: 18),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: const TextStyle(color: Colors.white)),

                  if (showTick) ...[
                    const SizedBox(width: 6),
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: Image.asset("assets/images/Vector.png"),
                    ),
                  ],
                ],
              ),

              if (subtitle1.isNotEmpty)
                Text(
                  subtitle1,
                  style: const TextStyle(color: Color(0xFF565656)),
                ),

              if (subtitle2.isNotEmpty)
                Text(
                  subtitle2,
                  style: const TextStyle(color: Color(0xFFB5CDFE)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 MENU ITEM
  static Widget _menuItem(String icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon, width: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
        ],
      ),
    );
  }

  // /// 🔹 BOTTOM NAV
  // static Widget _bottomNav(BuildContext context, double w) {
  //   return Container(
  //     height: 90,
  //     padding: EdgeInsets.symmetric(horizontal: 40 * w),
  //     color: Colors.black,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         navItem(context, "assets/images/home.png", DashboardScreen()),
  //         navItem(context, "assets/images/route-square.png", LoginScreen()),
  //         navItem(
  //           context,
  //           "assets/images/notification-bing.png",
  //           LoginScreen(),
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset("assets/images/profile.png", width: 28),
  //             const SizedBox(height: 4),
  //             Container(
  //               width: 7,
  //               height: 7,
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 shape: BoxShape.circle,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  //   static Widget navItem(BuildContext context, String icon, Widget screen) {
  //     return InkWell(
  //       onTap: () {
  //         Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  //       },
  //       child: Image.asset(icon, width: 28),
  //     );
  //   }
}
