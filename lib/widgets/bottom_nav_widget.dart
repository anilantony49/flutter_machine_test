import 'package:flutter/material.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/filter_page.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/login_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/profile_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/sales_list_screen.dart';

Widget bottomNav(BuildContext context, double w, int currentIndex) {
  return Container(
    height: 90,
    padding: EdgeInsets.symmetric(horizontal: 40 * w),
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        navItem(
          context: context,
          icon: "assets/images/home.png",
          screen: const DashboardScreen(),
          isSelected: currentIndex == 0,
        ),
        navItem(
          context: context,
          icon: "assets/images/route-square.png",
          screen: SalesListScreen(),
          isSelected: currentIndex == 1,
        ),
        navItem(
          context: context,
          icon: "assets/images/notification-bing.png",
          screen: FilterPage(),
          isSelected: currentIndex == 2,
        ),
        navItem(
          context: context,
          icon: "assets/images/profile.png",
          screen: ProfileScreen(),
          isSelected: currentIndex == 3,
        ),
      ],
    ),
  );
}

Widget navItem({
  required BuildContext context,
  required String icon,
  required Widget screen,
  required bool isSelected,
}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 28,
          color: isSelected ? Colors.white : Colors.grey, // optional
        ),

        if (isSelected) ...[
          const SizedBox(height: 4),
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    ),
  );
}
