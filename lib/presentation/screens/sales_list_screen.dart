import 'package:flutter/material.dart';
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
      if (mounted) {
        setState(() => _opacity = 1.0);
      }
    });
  }

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
        child: Stack(
          children: [
            /// 🔹 Back Button
            Positioned(
              top: 72 * h,
              left: 18 * w,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(3 * w),
                child: SizedBox(
                  width: 24 * w,
                  height: 24 * w,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),

            Positioned(
              top: 72 * h,
              left: 54 * w,
              child: SizedBox(
                width: 67 * w,
                height: 24 * h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Invoices",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16 * w,
                      fontWeight: FontWeight.w500, // Medium
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,
                      color: Colors.white, // use white for dark UI
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 114 * h,
              left: 0,
              right: 0,
              child: Container(height: 1, color: const Color(0xFF1C3347)),
            ),

            Positioned(
              top: 125 * h,
              left: 22 * w,
              child: Container(
                width: 236 * w,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF08131E),
                  borderRadius: BorderRadius.circular(8 * w),
                  border: Border.all(color: Color(0xFF1C3347)),
                ),

                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12 * w),

                      child: SizedBox(
                        width: 20 * w,
                        height: 20 * w,
                        child: Image.asset("assets/images/Magnifier.png"),
                      ),
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15 * w,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // line-height: 100%
                        letterSpacing: 0,
                        color: const Color(0xFF8A8A8A), // text color
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 125 * h,
              left: 271 * w,
              child: Container(
                width: 143 * w,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2B30), // background
                  borderRadius: BorderRadius.circular(8 * w),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder:
                            (_, __, ___) => DashboardScreen(), // 🔁 replace
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
                  borderRadius: BorderRadius.circular(8 * w),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16 * w, 7, 16 * w, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24 * h,
                          width: 24 * w,
                          child: Image.asset("assets/images/list-filter.png"),
                        ),

                        SizedBox(width: 9 * w), // gap: 9px

                        Text(
                          "Add Filters",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15 * w,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                            height: h * 1.0, // line-height: 100%
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 186 * h,
              left: 0,
              right: 0,
              child: Container(height: 1, color: const Color(0xFF1C3347)),
            ),

            Positioned(
              top: 194 * h,
              left: 24 * w,
              child: Container(
                width: 387 * w,
                height: 291 * h,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F0F0F),
                  borderRadius: BorderRadius.circular(16 * w),
                ),
                child: GestureDetector(
                  onTap: _handleTap,

                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    opacity: _opacity,
                    child:
                    //  Column(
                    //   children: [
                    //     Container(
                    //       width: 387 * w,
                    //       height: 57 * h,
                    //       color: Colors.grey,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               SizedBox(
                    //                 width: 79 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "#Invoice No",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight:
                    //                           FontWeight.w400, // Regular
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors.white, // adjust if needed
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 117 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "Customer Name",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 14 * w,
                    //                       fontWeight: FontWeight.w500, // Medium
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors
                    //                               .white, // use white for dark UI
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Spacer(),
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               SizedBox(
                    //                 width: 53 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment:
                    //                       Alignment
                    //                           .centerRight, // right aligned
                    //                   child: Text(
                    //                     "Pending",
                    //                     textAlign: TextAlign.right,
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight: FontWeight.w400,
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color: const Color(
                    //                         0xFFE81C1C,
                    //                       ), // red text
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 92 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerRight,
                    //                   child: RichText(
                    //                     textAlign: TextAlign.right,
                    //                     text: TextSpan(
                    //                       children: [
                    //                         TextSpan(
                    //                           text: "SAR. ",
                    //                           style: TextStyle(
                    //                             fontFamily: 'Poppins',
                    //                             fontSize: 12 * w,
                    //                             fontWeight: FontWeight.w400,
                    //                             height:
                    //                                 1.0, // line-height: 100%
                    //                             letterSpacing: 0,
                    //                             color: Color(0xFF888888),
                    //                           ),
                    //                         ),
                    //                         TextSpan(
                    //                           text: "10,000.00",
                    //                           style: TextStyle(
                    //                             fontSize: 12 * w,
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.w400,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(width: 16 * w), // right padding
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(height: 10 * h), // gap between rows
                    //     Container(
                    //       width: 387 * w,
                    //       height: 1, // must be 1, not 0
                    //       decoration: const BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //           colors: [
                    //             Color(0x0008131E), // transparent
                    //             Color(0xFF1C3347), // center color
                    //             Color(0x0008131E), // transparent
                    //           ],
                    //           stops: [0.0, 0.4844, 1.0], // matches 48.44%
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 387 * w,
                    //       height: 57 * h,
                    //       color: Colors.grey,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               SizedBox(
                    //                 width: 79 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "#Invoice No",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight:
                    //                           FontWeight.w400, // Regular
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors.white, // adjust if needed
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 117 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "Customer Name",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 14 * w,
                    //                       fontWeight: FontWeight.w500, // Medium
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors
                    //                               .white, // use white for dark UI
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Spacer(),
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               SizedBox(
                    //                 width: 53 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment:
                    //                       Alignment
                    //                           .centerRight, // right aligned
                    //                   child: Text(
                    //                     "Pending",
                    //                     textAlign: TextAlign.right,
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight: FontWeight.w400,
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color: const Color(
                    //                         0xFFE81C1C,
                    //                       ), // red text
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 92 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerRight,
                    //                   child: RichText(
                    //                     textAlign: TextAlign.right,
                    //                     text: TextSpan(
                    //                       children: [
                    //                         TextSpan(
                    //                           text: "SAR. ",
                    //                           style: TextStyle(
                    //                             fontFamily: 'Poppins',
                    //                             fontSize: 12 * w,
                    //                             fontWeight: FontWeight.w400,
                    //                             height:
                    //                                 1.0, // line-height: 100%
                    //                             letterSpacing: 0,
                    //                             color: Color(0xFF888888),
                    //                           ),
                    //                         ),
                    //                         TextSpan(
                    //                           text: "10,000.00",
                    //                           style: TextStyle(
                    //                             fontSize: 12 * w,
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.w400,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(width: 16 * w), // right padding
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(height: 10 * h), // gap between rows
                    //     Container(
                    //       width: 387 * w,
                    //       height: 1, // must be 1, not 0
                    //       decoration: const BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //           colors: [
                    //             Color(0x0008131E), // transparent
                    //             Color(0xFF1C3347), // center color
                    //             Color(0x0008131E), // transparent
                    //           ],
                    //           stops: [0.0, 0.4844, 1.0], // matches 48.44%
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 387 * w,
                    //       height: 57 * h,
                    //       color: Colors.grey,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               SizedBox(
                    //                 width: 79 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "#Invoice No",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight:
                    //                           FontWeight.w400, // Regular
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors.white, // adjust if needed
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 117 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "Customer Name",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 14 * w,
                    //                       fontWeight: FontWeight.w500, // Medium
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors
                    //                               .white, // use white for dark UI
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Spacer(),
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               SizedBox(
                    //                 width: 53 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment:
                    //                       Alignment
                    //                           .centerRight, // right aligned
                    //                   child: Text(
                    //                     "Pending",
                    //                     textAlign: TextAlign.right,
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight: FontWeight.w400,
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color: const Color(
                    //                         0xFFE81C1C,
                    //                       ), // red text
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 92 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerRight,
                    //                   child: RichText(
                    //                     textAlign: TextAlign.right,
                    //                     text: TextSpan(
                    //                       children: [
                    //                         TextSpan(
                    //                           text: "SAR. ",
                    //                           style: TextStyle(
                    //                             fontFamily: 'Poppins',
                    //                             fontSize: 12 * w,
                    //                             fontWeight: FontWeight.w400,
                    //                             height:
                    //                                 1.0, // line-height: 100%
                    //                             letterSpacing: 0,
                    //                             color: Color(0xFF888888),
                    //                           ),
                    //                         ),
                    //                         TextSpan(
                    //                           text: "10,000.00",
                    //                           style: TextStyle(
                    //                             fontSize: 12 * w,
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.w400,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(width: 16 * w), // right padding
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(height: 10 * h), // gap between rows
                    //     Container(
                    //       width: 387 * w,
                    //       height: 1, // must be 1, not 0
                    //       decoration: const BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //           colors: [
                    //             Color(0x0008131E), // transparent
                    //             Color(0xFF1C3347), // center color
                    //             Color(0x0008131E), // transparent
                    //           ],
                    //           stops: [0.0, 0.4844, 1.0], // matches 48.44%
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 387 * w,
                    //       height: 57 * h,
                    //       color: Colors.grey,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               SizedBox(
                    //                 width: 79 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "#Invoice No",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight:
                    //                           FontWeight.w400, // Regular
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors.white, // adjust if needed
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 117 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerLeft,
                    //                   child: Text(
                    //                     "Customer Name",
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 14 * w,
                    //                       fontWeight: FontWeight.w500, // Medium
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color:
                    //                           Colors
                    //                               .white, // use white for dark UI
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Spacer(),
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               SizedBox(
                    //                 width: 53 * w,
                    //                 height: 20 * h,
                    //                 child: Align(
                    //                   alignment:
                    //                       Alignment
                    //                           .centerRight, // right aligned
                    //                   child: Text(
                    //                     "Pending",
                    //                     textAlign: TextAlign.right,
                    //                     style: TextStyle(
                    //                       fontFamily: 'Poppins',
                    //                       fontSize: 13 * w,
                    //                       fontWeight: FontWeight.w400,
                    //                       height: 1.0, // line-height: 100%
                    //                       letterSpacing: 0,
                    //                       color: const Color(
                    //                         0xFFE81C1C,
                    //                       ), // red text
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 92 * w,
                    //                 height: 21 * h,
                    //                 child: Align(
                    //                   alignment: Alignment.centerRight,
                    //                   child: RichText(
                    //                     textAlign: TextAlign.right,
                    //                     text: TextSpan(
                    //                       children: [
                    //                         TextSpan(
                    //                           text: "SAR. ",
                    //                           style: TextStyle(
                    //                             fontFamily: 'Poppins',
                    //                             fontSize: 12 * w,
                    //                             fontWeight: FontWeight.w400,
                    //                             height:
                    //                                 1.0, // line-height: 100%
                    //                             letterSpacing: 0,
                    //                             color: Color(0xFF888888),
                    //                           ),
                    //                         ),
                    //                         TextSpan(
                    //                           text: "10,000.00",
                    //                           style: TextStyle(
                    //                             fontSize: 12 * w,
                    //                             color: Colors.white,
                    //                             fontWeight: FontWeight.w400,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(width: 16 * w), // right padding
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(height: 10 * h), // gap between rows
                    //     Container(
                    //       width: 387 * w,
                    //       height: 1, // must be 1, not 0
                    //       decoration: const BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //           colors: [
                    //             Color(0x0008131E), // transparent
                    //             Color(0xFF1C3347), // center color
                    //             Color(0x0008131E), // transparent
                    //           ],
                    //           stops: [0.0, 0.4844, 1.0], // matches 48.44%
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (_, __) => gradientDivider(w),
                      itemBuilder: (_, index) => invoiceRow(w, h),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
