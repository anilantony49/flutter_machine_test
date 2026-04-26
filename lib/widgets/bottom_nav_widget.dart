// import 'package:flutter/material.dart';

// void bottomNavWidget(BuildContext context, Widget page) {
//   Navigator.push(
//     context,
//     PageRouteBuilder(
//       transitionDuration: const Duration(milliseconds: 200),
//       pageBuilder: (_, __, ___) => page,
//       transitionsBuilder: (_, animation, __, child) {
//         return FadeTransition(
//           opacity: CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeOut,
//           ),
//           child: child,
//         );
//       },
//     ),
//   );
// }