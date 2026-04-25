import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/screens/second_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 430,
        height: 932,
        child: Container(
          color: const Color(0xFF000000), // background: #000000
          child: Stack(
            children: [
              Positioned(
                top: 247,
                left: -12,
                child: Container(
                  width: 507,
                  height: 714,
                  child: Stack(
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 110, // adjust for spread
                          sigmaY: 110,
                        ),
                        child: Container(
                          width: 124,
                          height: 124,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFEEF223),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 486,
                        left: 62,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 100, // adjust for spread
                            sigmaY: 100,
                          ),
                          child: Container(
                            width: 124,
                            height: 124,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFC6BFF),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 187,
                        left: 383,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 85, // adjust for spread
                            sigmaY: 85,
                          ),
                          child: Container(
                            width: 124,
                            height: 124,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF00D0FE),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Icon
              Positioned(
                top: 85,
                left: 316,
                child: Image.asset(
                  "assets/images/language-hiragana.png",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),

              // English Text
              Positioned(
                top: 88,
                left: 345,
                child: GestureDetector(
                  onTap: () {
                    // Navigate: None (as per your spec)
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1, // always visible (no state change here)
                    curve: Curves.linear,
                    child: Text(
                      "English",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // line-height: 100%
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 304,
                left: 189,
                child: GestureDetector(
                  onTap: () {
                    // Navigate: None (as per your spec)
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1, // always visible (no state change here)
                    curve: Curves.linear,
                    child: Container(
                      height: 52,
                      width: 52,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          height: 1.0, // line-height: 100%
                          letterSpacing: -1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 336,
                left: 117,
                child: Container(
                  height: 23,
                  width: 196,
                  child: Text(
                    "Login to your vikn account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,
                      color: const Color(0xFF838383),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 386,
                left: 36,
                child: Container(
                  width: 358,
                  height: 119,
                  decoration: BoxDecoration(
                    color: const Color(0xFF08131E),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      color: const Color(0xFF1C3347),
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 11,
                        left: 60,
                        child: Text(
                          "Username",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: 0,
                            color: const Color(0xFF7D7D7D),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 25,
                        left: 60,
                        child: Container(
                          width: 118,
                          height: 23,
                          alignment:
                              Alignment.centerLeft, // text starts from left
                          // color: const Color(0xFFFFFFFF), // background: #FFFFFF
                          child: Text(
                            "Savadfarooque",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500, // Medium
                              height: 1.0, // line-height: 100%
                              letterSpacing: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 59,
                        left: 1,
                        child: Container(
                          width: 358,
                          height: 1, // use 1 instead of 0 to make it visible
                          color: const Color(0xFF1C3347), // border color
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 60,

                        child: Container(
                          width: 275,
                          height: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Username",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    letterSpacing: 0,
                                    color: const Color(0xFF7D7D7D),
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
              Positioned(
                top: 404,
                left: 55,
                child: Image.asset(
                  "assets/images/user-2.png",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 463,
                left: 56,
                child: Image.asset(
                  "assets/images/key-round.png",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 534,
                left: 140,
                child: Text(
                  "Forgotten Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xFF0A9EF3),
                  ),
                ),
              ),

              Positioned(
                top: 593,
                left: 152,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to: "iPhone 14 Pro Max - 2"
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (_, __, ___) => const SecondScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation, // smart animate (approx)
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    width: 125,
                    height: 48,
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E75F4), // background
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign in",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            height: 1.0,
                            fontSize: 16,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 9), // gap: 9px
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 809,
                left: 124,
                child: Container(
                  width: 179,
                  height: 23,
                  alignment: Alignment.center,
                  // color: const Color(0xFFFFFFFF), // background: #FFFFFF
                  child: Text(
                    "Don’t have an Account?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 836,
                left: 167,
                child: Text(
                  "Sign up now!",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: -1,
                    color: const Color(0xFF0A9EF3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
