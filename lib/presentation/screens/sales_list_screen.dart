import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/widgets/invoice_box_row_widget.dart';

class SalesListScreen extends StatefulWidget {
  const SalesListScreen({super.key});

  @override
  State<SalesListScreen> createState() => _SalesListScreenState();
}

class _SalesListScreenState extends State<SalesListScreen> {
  double _opacity = 1.0;

  void _handleTap() {
    setState(() => _opacity = 0.5);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18 * w),
          child: Column(
            children: [
              // const SizedBox(height: 70),

              /// 🔹 HEADER
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 70),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Invoices",
                      style: GoogleFonts.poppins(
                        fontSize: 16 * w,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              _divider(),

              const SizedBox(height: 10),

              /// 🔹 SEARCH + FILTER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),

                child: Row(
                  children: [
                    /// SEARCH
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF08131E),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xFF1C3347)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Magnifier.png",
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Search",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF8A8A8A),
                                fontSize: 15 * w,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// FILTER BUTTON
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DashboardScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/list-filter.png",
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add Filters",
                              style: GoogleFonts.poppins(
                                fontSize: 15 * w,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              _divider(),

              const SizedBox(height: 10),

              /// 🔹 LIST CONTAINER
              Expanded(
                child: GestureDetector(
                  onTap: _handleTap,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _opacity,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        // color: const Color(0xFF0F0F0F),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (_, __) => gradientDivider(w),
                        itemBuilder: (_, index) => invoiceRow(w, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 DIVIDER
  Widget _divider() {
    return Container(height: 1, color: const Color(0xFF1C3347));
  }
}
