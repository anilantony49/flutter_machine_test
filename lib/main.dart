import 'package:flutter/material.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/filter_page.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/login_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/profile_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/sales_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
