import 'package:flutter/material.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/filter_page.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/profile_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/sales_list_screen.dart';

Widget bottomNav(BuildContext context, double w, int currentIndex) {
  return Container(
    height: 90 * w,
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
          w: w,
        ),
        navItem(
          context: context,
          icon: "assets/images/route-square.png",
          screen: const SalesListScreen(),
          isSelected: currentIndex == 1,
          w: w,
        ),
        navItem(
          context: context,
          icon: "assets/images/notification-bing.png",
          screen: const FilterPage(),
          isSelected: currentIndex == 2,
          w: w,
        ),
        navItem(
          context: context,
          icon: "assets/images/profile.png",
          screen: const ProfileScreen(),
          isSelected: currentIndex == 3,
          w: w,
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
  required double w,
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
          width: 28 * w,
          color: isSelected ? Colors.white : Colors.grey,
        ),
        if (isSelected) ...[
          SizedBox(height: 4 * w),
          Container(
            width: 7 * w,
            height: 7 * w,
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
