import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget invoiceRow(double w, double h) {
  return Container(
    width: double.infinity,
    height: 57 * h,
    padding: EdgeInsets.symmetric(horizontal: 16 * w),
    child: Row(
      children: [
        /// LEFT SIDE
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "#",
                    style: GoogleFonts.poppins(
                      fontSize: 15 * w,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF888888),
                    ),
                  ),
                  TextSpan(
                    text: "Invoice No",
                    style: GoogleFonts.poppins(
                      fontSize: 13 * w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "Customer Name",
              style: GoogleFonts.poppins(
                fontSize: 14 * w,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),

        const Spacer(),

        /// RIGHT SIDE
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Pending",
              style: GoogleFonts.poppins(
                fontSize: 13 * w,
                color: Color(0xFFE81C1C),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "SAR. ",
                    style: GoogleFonts.poppins(
                      fontSize: 12 * w,
                      color: Color(0xFF888888),
                    ),
                  ),
                  TextSpan(
                    text: "10,000.00",
                    style: GoogleFonts.poppins(
                      fontSize: 14 * w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget gradientDivider(double w) {
  return Container(
    width: double.infinity,
    height: 1,
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0x0008131E), Color(0xFF1C3347), Color(0x0008131E)],
      ),
    ),
  );
}
