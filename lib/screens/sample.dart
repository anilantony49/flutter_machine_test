import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          // TextField Container
          Positioned(
            top: 386 * h,
            left: 36 * w,
            child: Container(
              width: 358 * w,
              height: 119 * h,
              decoration: BoxDecoration(
                color: const Color(0xFF08131E),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: const Color(0xFF1C3347), width: 1),
              ),
              child: Column(
                children: [
                  /// 🔹 USERNAME FIELD
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60 * w,
                      vertical: 8 * h,
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: 15 * w,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14 * w,
                          color: const Color(0xFF7D7D7D),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  /// 🔹 DIVIDER
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFF1C3347),
                  ),

                  /// 🔹 PASSWORD FIELD
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60 * w,
                      vertical: 8 * h,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      style: GoogleFonts.poppins(
                        fontSize: 15 * w,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14 * w,
                          color: const Color(0xFF7D7D7D),
                        ),
                        border: InputBorder.none,
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
