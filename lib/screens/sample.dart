import 'package:flutter/material.dart';

class SalesListScreen extends StatelessWidget {
  const SalesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const baseWidth = 430;
    final w = screenWidth / baseWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18 * w, vertical: 72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Header Row
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(8 * w),
                    child: Padding(
                      padding: EdgeInsets.all(4 * w),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22 * w,
                      ),
                    ),
                  ),

                  SizedBox(width: 12 * w),

                  Text(
                    "Invoices",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16 * w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// 🔹 Body (placeholder)
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}