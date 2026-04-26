import 'package:flutter/material.dart';

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
                children: [
                  SizedBox(height: 40 * h),

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
                      Container(
                        width: 40 * w,
                        height: 40 * w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF131313),
                          borderRadius: BorderRadius.circular(12 * w),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 20 * w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}