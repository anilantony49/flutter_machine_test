import 'dart:math';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
          /// 🔹 HEADER
          Positioned(
            top: 63 * h,
            left: 30 * w,
            child: SizedBox(
              width: 371 * w,
              height: 61 * h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 138 * w,
                    height: 34 * h,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Group.png",
                          width: 29 * w,
                          height: 31 * h,
                        ),
                        SizedBox(width: 8 * w),
                        Row(
                          children: [
                            Text(
                              "CabZing",
                              style: TextStyle(
                                fontSize: 22 * w,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4 * w),
                            Container(
                              width: 5 * w,
                              height: 5 * w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF436FC8),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/Frame 12.png",
                    width: 61 * w,
                    height: 61 * h,
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 MAIN CARD
          Positioned(
            top: 139 * h,
            left: 24 * w,
            child: Container(
              width: 382 * w,
              height: 394 * h,
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(29 * w),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 19 * h,
                    left: 20 * w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "SAR ",
                            style: TextStyle(
                              fontSize: 14 * w,
                              color: const Color(0xFF929292),
                            ),
                          ),
                          TextSpan(
                            text: "2,78,000.00",
                            style: TextStyle(
                              fontSize: 14 * w,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 35 * h,
                    left: 20 * w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "+21% ",
                            style: TextStyle(
                              fontSize: 12 * w,
                              color: const Color(0xFF199E56),
                            ),
                          ),
                          TextSpan(
                            text: "than last month",
                            style: TextStyle(
                              fontSize: 12 * w,
                              color: const Color(0xFF8F8F8F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 18 * h,
                    left: 285 * w,
                    child: Text(
                      "Revenue",
                      style: TextStyle(
                        fontSize: 16 * w,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 299 * h,
                    left: 133 * w,
                    child: Text(
                      "September 2023",
                      style: TextStyle(
                        fontSize: 13 * w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 SECOND CARD
          Positioned(
            top: 533 * h,
            left: 28 * w,
            child: Container(
              width: 373 * w,
              height: 129 * h,
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(33 * w),
              ),
              child: Padding(
                padding: EdgeInsets.all(16 * w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10 * w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6EFED),
                            borderRadius: BorderRadius.circular(50 * w),
                          ),
                          child: Image.asset(
                            'assets/images/sticker.png',
                            width: 20 * w,
                          ),
                        ),
                        SizedBox(width: 10 * w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bookings",
                              style: TextStyle(
                                fontSize: 14 * w,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "123",
                              style: TextStyle(
                                fontSize: 22 * w,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Reserved",
                              style: TextStyle(
                                fontSize: 14 * w,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 60 * w,
                      height: 60 * w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF131313),
                        borderRadius: BorderRadius.circular(15 * w),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 18 * w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}