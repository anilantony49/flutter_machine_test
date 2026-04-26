import 'package:flutter/material.dart';

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
            Text(
              "#Invoice No",
              style: TextStyle(fontSize: 13 * w, color: Colors.white),
            ),
            Text(
              "Customer Name",
              style: TextStyle(
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
              style: TextStyle(fontSize: 13 * w, color: Color(0xFFE81C1C)),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "SAR. ",
                    style: TextStyle(
                      fontSize: 12 * w,
                      color: Color(0xFF888888),
                    ),
                  ),
                  TextSpan(
                    text: "10,000.00",
                    style: TextStyle(fontSize: 14 * w, color: Colors.white),
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
