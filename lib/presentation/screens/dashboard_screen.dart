import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/widgets/bottom_nav_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0 * w,
            vertical: 20.0 * w,
          ),
          child: Column(
            children: [
              _buildHeader(w),
              SizedBox(height: 10 * w),
              _buildRevenueCard(w),
              SizedBox(height: 20 * w),
              _buildSummaryCard(
                iconPath: 'assets/images/sticker.png',
                iconBgColor: const Color(0xFFF6EFED),
                title: 'Bookings',
                value: '123',
                subtitle: 'Reserved',
                w: w,
              ),
              SizedBox(height: 10 * w),
              _buildSummaryCard(
                iconPath: 'assets/images/moneybag.png',
                iconBgColor: const Color(0xFFA9C9C5),
                title: 'Invoices',
                value: '10,232.00',
                subtitle: 'Rupees',
                w: w,
              ),
              SizedBox(height: 20 * w), // Bottom padding
            ],
          ),
        ),
      ),
      ///   BOTTOM NAV
      bottomNavigationBar: bottomNav(context, w, 0),
    );
  }

  Widget _buildHeader(double w) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/Group.png",
              width: 30 * w,
              height: 30 * w,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12 * w),
            Text(
              "CabZing",
              style: GoogleFonts.poppins(
                fontSize: 22 * w,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5 * w,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4 * w),
            Container(
              width: 6 * w,
              height: 6 * w,
              decoration: const BoxDecoration(
                color: Color(0xFF436FC8),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/Frame 12.png",
          width: 61 * w,
          height: 61 * w,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildRevenueCard(double w) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(29 * w),
      ),
      padding: EdgeInsets.all(24 * w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "SAR ",
                          style: GoogleFonts.poppins(
                            fontSize: 14 * w,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: const Color(0xFF929292),
                          ),
                        ),
                        TextSpan(
                          text: "2,78,000.00",
                          style: GoogleFonts.poppins(
                            fontSize: 14 * w,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "+21% ",
                          style: GoogleFonts.poppins(
                            fontSize: 12 * w,
                            color: const Color(0xFF199E56),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "than last month.",
                          style: GoogleFonts.poppins(
                            fontSize: 12 * w,
                            color: const Color(0xFF8F8F8F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Revenue",
                style: GoogleFonts.poppins(
                  fontSize: 16 * w,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 30 * w),

          // Chart Section
          SizedBox(
            height: 190 * w,
            child: Row(
              children: [
                // Y-Axis Labels
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["4K", "3K", "2K", "1K", "0"]
                      .map(
                        (label) => Text(
                          label,
                          style: GoogleFonts.poppins(
                            fontSize: 10 * w,
                            color: const Color(0xFF8F8F8F),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(width: 8 * w),
                Expanded(
                  child: Stack(
                    children: [
                      // Horizontal lines
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (index) => Container(
                            height: 1,
                            color: const Color(0xFF1C3347),
                          ),
                        ),
                      ),

                      // Chart Vector and Gradient
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 10 * w,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF007FA7), Color(0x00000000)],
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/Vector 1.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      // Vertical line & Tooltip (at index 02)
                      Positioned(
                        left: 118 * w,
                        top: 0,
                        bottom: 0,
                        child: Column(
                          children: [
                            Text(
                              "SAR 3945.00",
                              style: GoogleFonts.poppins(
                                fontSize: 12 * w,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 4 * w),
                            Expanded(
                              child: Container(
                                width: 1,
                                color: const Color(0xFFE3E3E3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20 * w),

          // Month Year text
          Center(
            child: Text(
              "September 2023",
              style: GoogleFonts.poppins(
                fontSize: 13 * w,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(height: 16 * w),

          // X-Axis Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChartTab("01", false, w),
              _buildChartTab("02", true, w),
              _buildChartTab("03", false, w),
              _buildChartTab("04", false, w),
              _buildChartTab("05", false, w),
              _buildChartTab("06", false, w),
              _buildChartTab("07", false, w),
              _buildChartTab("08", false, w),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartTab(String text, bool isSelected, double w) {
    return Container(
      width: 32 * w,
      height: 32 * w,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2489E7) : const Color(0xFF131313),
        borderRadius: BorderRadius.circular(3 * w),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14 * w,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String iconPath,
    required Color iconBgColor,
    required String title,
    required String value,
    required String subtitle,
    required double w,
  }) {
    return Container(
      width: double.infinity,
      height: 126 * w,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(33 * w),
      ),
      child: Stack(
        children: [
          // Radial gradient overlay (glow effect)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33 * w),
                gradient: const RadialGradient(
                  center: Alignment(-0.9, -0.8),
                  radius: 1.2,
                  colors: [
                    Color.fromRGBO(255, 154, 125, 0.04),
                    Colors.transparent,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0 * w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40 * w,
                      height: 90 * w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11 * w,
                        vertical: 6 * w,
                      ),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(111 * w),
                      ),
                      child: Center(
                        child: Image.asset(
                          iconPath,
                          width: 18 * w,
                          height: 18 * w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 16 * w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 14 * w,
                            fontWeight: FontWeight.w200,
                            color: iconBgColor,
                          ),
                        ),
                        SizedBox(height: 6 * w),
                        Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontSize: 22 * w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14 * w,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF565656),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 75 * w,
                  height: 75 * w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF131313),
                    borderRadius: BorderRadius.circular(17 * w),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20 * w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

