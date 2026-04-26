import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/widgets/bottom_nav_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildRevenueCard(),
              const SizedBox(height: 20),
              _buildSummaryCard(
                iconPath: 'assets/images/sticker.png',
                iconBgColor: const Color(0xFFF6EFED),
                title: 'Bookings',
                value: '123',
                subtitle: 'Reserved',
              ),
              const SizedBox(height: 10),
              _buildSummaryCard(
                iconPath: 'assets/images/moneybag.png',
                iconBgColor: const Color(0xFFA9C9C5),
                title: 'Invoices',
                value: '10,232.00',
                subtitle: 'Rupees',
              ),
              const SizedBox(height: 20), // Bottom padding
              
            ],
          ),
        ),
        
      ),
         /// 🔹 BOTTOM NAV
    bottomNavigationBar: bottomNav(context, w, 0),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/Group.png",
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            const Text(
              "CabZing",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF436FC8),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/Frame 12.png",
          width: 61,
          height: 61,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildRevenueCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(29),
      ),
      padding: const EdgeInsets.all(24),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w400, // Regular
                            height: 17 / 14, // line-height: 17px
                            color: const Color(0xFF929292),
                          ),
                        ),
                        TextSpan(
                          text: "2,78,000.00",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500, // Medium
                            height: 17 / 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "+21% ",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF199E56),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "than last month.",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF8F8F8F),
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
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Chart Section
          SizedBox(
            height: 190,
            child: Stack(
              children: [
                // Horizontal lines
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    5,
                    (index) =>
                        Container(height: 1, color: const Color(0xFF1C3347)),
                  ),
                ),

                // Y-Axis Labels
                Positioned(
                  bottom: 35,
                  left: 0,
                  child: Text(
                    "0",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 0,
                  child: Text(
                    "1K",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 110,
                  left: 0,
                  child: Text(
                    "2K",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 110,
                  left: 0,
                  child: Text(
                    "3K",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 110,
                  left: 0,
                  child: Text(
                    "4K",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ),

                // Chart Vector and Gradient
                Positioned(
                  left: 20,
                  right: 0,
                  top: 10,
                  bottom: 30,
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

                // Vertical line & Tooltip
                Positioned(
                  left: 118,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      Text(
                        "SAR 3945.00",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
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

          const SizedBox(height: 20),

          // Month Year text
          Center(
            child: Text(
              "September 2023",
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // X-Axis Tabs (01, 02, 03)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChartTab("01", false),
              _buildChartTab("02", true),
              _buildChartTab("03", false),
              _buildChartTab("04", false),
              _buildChartTab("05", false),
              _buildChartTab("06", false),
              _buildChartTab("07", false),
              _buildChartTab("08", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartTab(String text, bool isSelected) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2489E7) : const Color(0xFF131313),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
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
  }) {
    return Container(
      width: double.infinity,
      height: 126,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(33),
      ),
      child: Stack(
        children: [
          // Radial gradient overlay (glow effect)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 90,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(111),
                      ),
                      child: Center(
                        child: Image.asset(
                          iconPath,
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: iconBgColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF565656),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFF131313),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
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

