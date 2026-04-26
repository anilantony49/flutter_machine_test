import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18 * w, right: 18 * w, top: 24 * h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///   HEADER
               
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  Text(
                    "Filters",
                    style: GoogleFonts.poppins(
                      fontSize: 16 * w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  const Spacer(),

                  Image.asset("assets/images/eye.png", width: 24 * w),

                  SizedBox(width: 16 * w),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => const DashboardScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
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
                    child: Text(
                      "Filter",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF0A9EF3),
                        fontSize: 14 * w,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10 * h),
              _divider(),

              /// 🔹 MONTH SELECTOR
              SizedBox(height: 16 * h),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15 * w,
                    vertical: 6 * h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF08131E),
                    borderRadius: BorderRadius.circular(41),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "This Month",
                          style: GoogleFonts.poppins(
                            fontSize: 15 * w,
                            fontWeight: FontWeight.w400,
                            height: 1.0, // line-height: 100%
                            letterSpacing: 0,
                            color: Colors.white, // use white on dark background
                          ),
                        ),
                      ),
                      SizedBox(width: 16 * w),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              ///   DATE PICKERS
              SizedBox(height: 20 * h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dateBox("12/09/2023"),
                  SizedBox(width: 10 * w),
                  _dateBox("12/09/2023"),
                ],
              ),

              SizedBox(height: 20 * h),
              _divider(),

              ///   STATUS CHIPS
              SizedBox(height: 20 * h),
              Row(
                children: [
                  _statusChip("Pending", true),
                  SizedBox(width: 10 * w),
                  _statusChip("Invoiced", false),
                  SizedBox(width: 10 * w),
                  _statusChip("Canceled", false),
                ],
              ),

              ///   CUSTOMER FIELD
              SizedBox(height: 20 * h),
              _inputField("Customer"),

              SizedBox(height: 20 * h),
              _gradientDivider(),

              ///   SELECTED CUSTOMER
              SizedBox(height: 20 * h),
              _selectedCustomer("savad farooque"),

              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  ///   Widgets

  Widget _divider() {
    return Container(height: 1, color: const Color(0xFF1C3347));
  }

  Widget _gradientDivider() {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x0008131E), Color(0xFF1C3347), Color(0x0008131E)],
        ),
      ),
    );
  }

  Widget _dateBox(String text) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2B30),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/calendar.png"),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.0, // line-height: 100%
              letterSpacing: 0,
              color: Colors.white, // use white for dark UI
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String text, bool active) {
    return Expanded(
      child: Container(
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? const Color(0xFF0E74F4) : const Color(0xFF1B2B30),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0,
            height: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hint) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF08131E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1C3347)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              hint,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.0, // line-height: 100%
                letterSpacing: 0,
                color: const Color(0xFFAEAEAE), // grey text
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _selectedCustomer(String name) {
    return Container(
      height: 47,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2B30),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.0, // line-height: 100%
              letterSpacing: 0,
              color: Colors.white, // visible on dark background
            ),
          ),
          SizedBox(width: 15),
          const Icon(Icons.close, color: Color(0xFF0A9EF3)),
        ],
      ),
    );
  }
}
