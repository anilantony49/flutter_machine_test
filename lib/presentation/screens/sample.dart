import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18 * w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER
              SizedBox(height: 16),
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

                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration:
                              const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) =>
                              const DashboardScreen(),
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

              SizedBox(height: 10),
              _divider(),

              /// 🔹 MONTH SELECTOR
              SizedBox(height: 16),
              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15 * w, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF08131E),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "This Month",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white),
                    ],
                  ),
                ),
              ),

              /// 🔹 DATE PICKERS
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _dateBox("12/09/2023")),
                  SizedBox(width: 10),
                  Expanded(child: _dateBox("12/09/2023")),
                ],
              ),

              SizedBox(height: 20),
              _divider(),

              /// 🔹 STATUS CHIPS
              SizedBox(height: 16),
              Row(
                children: [
                  _statusChip("Pending", true),
                  SizedBox(width: 10),
                  _statusChip("Invoiced", false),
                  SizedBox(width: 10),
                  _statusChip("Canceled", false),
                ],
              ),

              /// 🔹 CUSTOMER FIELD
              SizedBox(height: 20),
              _inputField("Customer"),

              SizedBox(height: 20),
              _gradientDivider(),

              /// 🔹 SELECTED CUSTOMER
              SizedBox(height: 20),
              _selectedCustomer("savad farooque"),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Widgets

  Widget _divider() {
    return Container(height: 1, color: const Color(0xFF1C3347));
  }

  Widget _gradientDivider() {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x0008131E),
            Color(0xFF1C3347),
            Color(0x0008131E),
          ],
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
        children: [
          const Icon(Icons.calendar_today, size: 16, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
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
          style: GoogleFonts.poppins(color: Colors.white),
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
              style: const TextStyle(color: Color(0xFFAEAEAE)),
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
        children: [
          Expanded(
            child: Text(name, style: const TextStyle(color: Colors.white)),
          ),
          const Icon(Icons.close, color: Color(0xFF0A9EF3)),
        ],
      ),
    );
  }
}