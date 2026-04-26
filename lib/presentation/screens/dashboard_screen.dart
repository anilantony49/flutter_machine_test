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
      backgroundColor: Colors.black, // optional
      body: Stack(
        children: [
          Positioned(
            top: 63 * h,
            left: 30 * w,
            child: SizedBox(
              width: 371 * w,
              height: 61 * h,
              // color: Colors.grey,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // color: Colors.deepPurple,
                      width: 138 * w,
                      height: 34 * h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/Group.png",
                            width: 29 * w,
                            height: 31 * h,
                            fit: BoxFit.contain,
                          ),
                          // Left side (example)
                          SizedBox(
                            width: 98 * w,
                            height: 34 * h,
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "CabZing",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 22 * w,
                                        fontWeight: FontWeight.w600,
                                        height: 1.0,
                                        letterSpacing: 1.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                // Blue dotsec
                                Container(
                                  width: 5 * w,
                                  height: 5 * h,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF436FC8),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/Frame 12.png",
                      width: 61 * w,
                      height: 61 * h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 139 * h,
            left: 24 * w,
            child: Container(
              width: 382 * w,
              height: 394 * h,
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F), // background
                borderRadius: BorderRadius.circular(29), // rounded corners
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 19 * h,
                    left: 20 * w,
                    child: SizedBox(
                      width: 110 * w,
                      height: 17 * h,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "SAR ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14 * w,
                                fontWeight: FontWeight.w400, // Regular
                                height: 17 / 14, // line-height: 17px
                                color: const Color(0xFF929292),
                              ),
                            ),
                            TextSpan(
                              text: "2,78,000.00",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14 * w,
                                fontWeight: FontWeight.w500, // Medium
                                height: 17 / 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 35 * h,
                    left: 20 * w,
                    child: SizedBox(
                      width: 130 * w,
                      height: 17 * h,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "+21% ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12 * w,
                                fontWeight: FontWeight.w400, // Regular
                                height: 1, // line-height: 17px
                                color: const Color(0xFF199E56),
                                letterSpacing: 0,
                              ),
                            ),
                            TextSpan(
                              text: "than last month.",

                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12 * w,
                                fontWeight: FontWeight.w400, // Medium
                                height: 1,
                                letterSpacing: 0,
                                color: const Color(0xFF8F8F8F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 18 * h,
                    left: 285 * w,
                    child: SizedBox(
                      width: 69 * w,
                      height: 24 * h,
                      child: Center(
                        child: Text(
                          "Revenue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16 * w,
                            fontWeight: FontWeight.w400, // Regular
                            height: 1.0, // line-height: 100%
                            letterSpacing: 0,
                            color:
                                Colors.white, // use white for dark background
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 299 * h,
                    left: 133 * w,
                    child: SizedBox(
                      width: 107 * w,
                      height: 20 * h,
                      child: Center(
                        child: Text(
                          "September 2023",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13 * w,
                            fontWeight: FontWeight.w400, // Regular
                            height: 1.0, // line-height: 100%
                            letterSpacing: 0,
                            color:
                                Colors.white, // use white for dark background
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 71 * h,
                    left: 118 * w,
                    child: SizedBox(
                      width: 107 * w,
                      height: 20 * h,
                      child: Center(
                        child: Text(
                          "SAR 3945.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12 * w,
                            fontWeight: FontWeight.w400, // Regular
                            height: 1.0, // line-height: 100%
                            letterSpacing: 0,
                            color:
                                Colors.white, // use white for dark background
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 118 * h,
                    left: 49 * w,
                    child: Container(
                      width: 305.5 * w,
                      height: 160.5 * h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF007FA7), // solid blue at top
                            Color(0x00000000), // transparent at bottom
                          ],
                        ),
                      ),
                      child: Image.asset("assets/images/Vector 1.png"),
                    ),
                  ),
                  Positioned(
                    top: 90 * h,
                    left: 152 * w,
                    child: Container(
                      width: 1, // thickness
                      height: 190 * h, // length
                      color: const Color(0xFFE3E3E3),
                    ),
                  ),
                  Positioned(
                    top: 283 * h,
                    left: 27 * w,
                    child: Container(
                      width: 328 * w,
                      height: 1,
                      color: const Color(0xFF1C3347),
                    ),
                  ),

                  Positioned(
                    top: 116 * h,
                    left: 27 * w,
                    child: Container(
                      width: 328 * w,
                      height: 1,
                      color: const Color(0xFF1C3347),
                    ),
                  ),

                  Positioned(
                    top: 239 * h,
                    left: 27 * w,
                    child: Container(
                      width: 328 * w,
                      height: 1,
                      color: const Color(0xFF1C3347),
                    ),
                  ),

                  Positioned(
                    top: 198 * h,
                    left: 27 * w,
                    child: Container(
                      width: 328 * w,
                      height: 1,
                      color: const Color(0xFF1C3347),
                    ),
                  ),

                  Positioned(
                    top: 157 * h,
                    left: 27 * w,
                    child: Container(
                      width: 328 * w,
                      height: 1,
                      color: const Color(0xFF1C3347),
                    ),
                  ),

                  Positioned(
                    top: 258 * h,
                    left: 26 * w,
                    child: SizedBox(
                      width: 7 * w,
                      height: 15 * h,
                      child: Text(
                        "0",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10 * w,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0xFF8F8F8F),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 334 * h,
                    left: 25 * w,
                    child: Container(
                      width: 32 * w,
                      height: 32 * w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF131313),
                        borderRadius: BorderRadius.circular(3 * w),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 6 * h,
                            left: 9 * w,
                            child: SizedBox(
                              width: 14 * w,
                              height: 21 * h,
                              child: Center(
                                child: Text(
                                  "01",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14 * w,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: -1,
                                    color:
                                        Colors.white, // use white for dark bg
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 334 * h,
                    left: 68 * w,
                    child: Container(
                      width: 32 * w,
                      height: 32 * w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2489E7),
                        borderRadius: BorderRadius.circular(3 * w),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 6 * h,
                            left: 9 * w,
                            child: SizedBox(
                              width: 14 * w,
                              height: 21 * h,
                              child: Center(
                                child: Text(
                                  "02",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14 * w,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: -1,
                                    color:
                                        Colors.white, // use white for dark bg
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 118,
                  //   left: 49,
                  //   child: Container(
                  //     width: 304,
                  //     height: 142,
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFF981B1B), // background
                  //       border: Border.all(
                  //         color: const Color(0xFF0A9BC9), // border color
                  //         width: 1,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 533 * h,
            left: 28 * w,
            child: SizedBox(
              width: 373 * w,
              height: 926 * h,
              // color: Colors.transparent, // optional
              child: Stack(
                children: [
                  Positioned(
                    top: 21 * h,
                    child: Container(
                      width: 373 * w,
                      height: 129 * h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F0F), // base background
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Stack(
                        children: [
                          // Radial gradient overlay (glow effect)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              gradient: const RadialGradient(
                                center: Alignment(
                                  -0.9,
                                  -0.8,
                                ), // approx (4.29%, 16.28%)
                                radius: 1.2,
                                colors: [
                                  Color.fromRGBO(
                                    255,
                                    154,
                                    125,
                                    0.04,
                                  ), // soft glow
                                  Colors.transparent,
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 40 * h,
                    left: 19 * w,
                    child: SizedBox(
                      width: 325 * w,
                      height: 92 * h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side (example)
                          Container(
                            width: 133 * w,
                            height: 92 * h,
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40 * w,
                                  height: 92 * h,
                                  padding: const EdgeInsets.fromLTRB(
                                    11,
                                    6,
                                    11,
                                    6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFF6EFED,
                                    ), // background
                                    borderRadius: BorderRadius.circular(
                                      111,
                                    ), // pill shape
                                  ),
                                  child: Image.asset(
                                    'assets/images/sticker.png',
                                    width: 18 * w,
                                    height: 18 * h,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bookings",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14 * w,
                                        fontWeight: FontWeight.w200, // Regular
                                        height: 1.0, // line-height: 17px
                                        color: Colors.white,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 78 * w,
                                      height: 47 * h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "123",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22 * w,
                                              fontWeight:
                                                  FontWeight.w400, // Regular
                                              height: 1.0, // line-height: 17px
                                              color: Colors.white,
                                              letterSpacing: 0,
                                            ),
                                          ),

                                          Text(
                                            "Reserved",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14 * w,
                                              fontWeight:
                                                  FontWeight.w400, // Regular
                                              height: 1.0, // line-height: 17px
                                              color: const Color(0xFF565656), //
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 75 * w,
                            height: 75 * w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF131313),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18 * w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // second card
                  Positioned(
                    top: 159 * h,
                    child: Container(
                      width: 373 * w,
                      height: 129 * h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F0F), // base background
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Stack(
                        children: [
                          // Radial gradient overlay (glow effect)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              gradient: const RadialGradient(
                                center: Alignment(
                                  -0.9,
                                  -0.8,
                                ), // approx (4.29%, 16.28%)
                                radius: 1.2,
                                colors: [
                                  Color.fromRGBO(
                                    255,
                                    154,
                                    125,
                                    0.04,
                                  ), // soft glow
                                  Colors.transparent,
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 177 * h,
                    left: 19 * w,
                    child: SizedBox(
                      width: 325 * w,
                      height: 92 * h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side (example)
                          Container(
                            width: 151 * w,
                            height: 92 * h,
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40 * w,
                                  height: 92 * h,
                                  padding: const EdgeInsets.fromLTRB(
                                    11,
                                    6,
                                    11,
                                    6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFA9C9C5,
                                    ), // background
                                    borderRadius: BorderRadius.circular(
                                      111,
                                    ), // pill shape
                                  ),
                                  child: Image.asset(
                                    'assets/images/moneybag.png',
                                    width: 18 * w,
                                    height: 18 * h,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invoices",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14 * w,
                                        fontWeight: FontWeight.w200, // Regular
                                        height: 1.0, // line-height: 17px
                                        color: Colors.white,
                                      ),
                                    ),

                                    SizedBox(
                                      // width: 96,
                                      height: 47 * h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "10,232.00",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22 * w,
                                              fontWeight:
                                                  FontWeight.w400, // Regular
                                              height: 1.0, // line-height: 17px
                                              color: Colors.white,
                                              letterSpacing: 0,
                                            ),
                                          ),

                                          Text(
                                            "Rupees",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14 * w,
                                              fontWeight:
                                                  FontWeight.w400, // Regular
                                              height: 1.0, // line-height: 17px
                                              color: const Color(0xFF565656), //
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 75 * w,
                            height: 75 * w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF131313),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18 * w,
                                color: Colors.white,
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
        ],
      ),
    );
  }
}
