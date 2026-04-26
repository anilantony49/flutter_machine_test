import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget invoiceRow(
  double w, {
  required String invoiceNo,
  required String customerName,
  required String status,
  required double amount,
  required String currency,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 8),
    child: Row(
      children: [
        /// LEFT SIDE
        Expanded(
          child: Column(
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
                        color: const Color(0xFF888888),
                      ),
                    ),
                    TextSpan(
                      text: invoiceNo,
                      style: GoogleFonts.poppins(
                        fontSize: 13 * w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                customerName,
                style: GoogleFonts.poppins(
                  fontSize: 14 * w,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        /// RIGHT SIDE
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              status,
              style: GoogleFonts.poppins(
                fontSize: 13 * w,
                color:
                    status.toLowerCase() == 'pending'
                        ? const Color(0xFFE81C1C)
                        : status.toLowerCase() == 'cancelled'
                        ? Colors.grey
                        : status.toLowerCase() == 'invoiced'
                        ? Colors.blue
                        : Colors.green,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$currency. ",
                    style: GoogleFonts.poppins(
                      fontSize: 12 * w,
                      color: const Color(0xFF888888),
                    ),
                  ),
                  TextSpan(
                    text: amount.toStringAsFixed(2),
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
