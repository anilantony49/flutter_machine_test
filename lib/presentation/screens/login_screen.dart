import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/dashboard_screen.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late final LoginController _loginController;

  @override
  void initState() {
    super.initState();
    final remoteDataSource = AuthRemoteDataSourceImpl();
    final repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);
    final loginUseCase = LoginUseCase(repository);
    _loginController = LoginController(loginUseCase: loginUseCase);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    _loginController.dispose();
    super.dispose();
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
      body: SizedBox(
        width: 430 * w,
        height: 932 * h,
        child: Container(
          color: const Color(0xFF000000), // background: #000000
          child: Stack(
            children: [
              Positioned(
                top: 247 * h,
                left: -12 * w,
                child: SizedBox(
                  width: 507 * w,
                  height: 714 * h,
                  child: Stack(
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 110, // adjust for spread
                          sigmaY: 110,
                        ),
                        child: Container(
                          width: 124 * w,
                          height: 124 * h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFEEF223),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 486 * h,
                        left: 62 * w,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 100, // adjust for spread
                            sigmaY: 100,
                          ),
                          child: Container(
                            width: 124 * w,
                            height: 124 * h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFC6BFF),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 187 * h,
                        left: 383 * w,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 85, // adjust for spread
                            sigmaY: 85,
                          ),
                          child: Container(
                            width: 124 * w,
                            height: 124 * h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF00D0FE),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Icon
              Positioned(
                top: 85 * h,
                left: 316 * w,
                child: Image.asset(
                  "assets/images/language-hiragana.png",
                  width: 24 * w,
                  height: 24 * h,
                  fit: BoxFit.contain,
                ),
              ),

              // English Text
              Positioned(
                top: 88 * h,
                left: 345 * w,
                child: GestureDetector(
                  onTap: () {
                    // Navigate: None (as per your spec)
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1, // always visible (no state change here)
                    curve: Curves.linear,
                    child: Text(
                      "English",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        fontSize: 14 * w,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // line-height: 100%
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 304 * h,
                left: 189 * w,
                child: GestureDetector(
                  onTap: () {
                    // Navigate: None (as per your spec)
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1, // always visible (no state change here)
                    curve: Curves.linear,
                    child: SizedBox(
                      height: 52 * h,
                      width: 52 * w,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          fontSize: 21 * w,
                          fontWeight: FontWeight.w500,
                          height: 1.0, // line-height: 100%
                          letterSpacing: -1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 336 * h,
                left: 117 * w,
                child: SizedBox(
                  height: 23 * h,
                  width: 196 * w,
                  child: Text(
                    "Login to your vikn account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15 * w,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,
                      color: const Color(0xFF838383),
                    ),
                  ),
                ),
              ),
              //TextField Container
              // Positioned(
              //   top: 386 * h,
              //   left: 36 * w,
              //   child: Container(
              //     width: 358 * w,
              //     height: 119 * h,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF08131E),
              //       borderRadius: BorderRadius.circular(11),
              //       border: Border.all(
              //         color: const Color(0xFF1C3347),
              //         width: 1,
              //       ),
              //     ),
              //     child: Stack(
              //       children: [
              //         Positioned(
              //           top: 11 * h,
              //           left: 60 * w,
              //           child: Text(
              //             "Username",
              //             style: GoogleFonts.poppins(
              //               fontSize: 14 * w,
              //               fontWeight: FontWeight.w400,
              //               height: 1.0,
              //               letterSpacing: 0,
              //               color: const Color(0xFF7D7D7D),
              //             ),
              //           ),
              //         ),

              //         Positioned(
              //           top: 25 * h,
              //           left: 60 * w,
              //           child: Container(
              //             width: 118 * w,
              //             height: 23 * h,
              //             alignment:
              //                 Alignment.centerLeft, // text starts from left
              //             // color: const Color(0xFFFFFFFF), // background: #FFFFFF
              //             child: Text(
              //               "Savadfarooque",
              //               style: GoogleFonts.poppins(
              //                 fontSize: 15 * w,
              //                 fontWeight: FontWeight.w500, // Medium
              //                 height: 1.0, // line-height: 100%
              //                 letterSpacing: 0,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Positioned(
              //           top: 59 * h,
              //           left: 1 * w,
              //           child: Container(
              //             width: 358 * w,
              //             height:
              //                 1 * h, // use 1 instead of 0 to make it visible
              //             color: const Color(0xFF1C3347), // border color
              //           ),
              //         ),
              //         Positioned(
              //           top: 70 * h,
              //           left: 60 * w,

              //           child: SizedBox(
              //             width: 275 * w,
              //             height: 32 * h,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Username",
              //                   style: GoogleFonts.poppins(
              //                     fontSize: 14 * w,
              //                     fontWeight: FontWeight.w400,
              //                     height: 1.0,
              //                     letterSpacing: 0,
              //                     color: const Color(0xFF7D7D7D),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // TextField Container
              Positioned(
                top: 386 * h,
                left: 36 * w,
                child: Container(
                  width: 358 * w,
                  // height: 119 * h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF08131E),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      color: const Color(0xFF1C3347),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      /// 🔹 USERNAME FIELD
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 60 * w,
                          vertical: 8 * h,
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          style: GoogleFonts.poppins(
                            fontSize: 15 * w,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14 * w,
                              color: const Color(0xFF7D7D7D),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      /// 🔹 DIVIDER
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xFF1C3347),
                      ),

                      /// 🔹 PASSWORD FIELD
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 60 * w,
                          vertical: 8 * h,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: false,
                          style: GoogleFonts.poppins(
                            fontSize: 15 * w,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 14 * w,
                              color: const Color(0xFF7D7D7D),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 404 * h,
                left: 55 * w,
                child: Image.asset(
                  "assets/images/user-2.png",
                  width: 24 * w,
                  height: 24 * h,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 463 * h,
                left: 56 * w,
                child: Image.asset(
                  "assets/images/key-round.png",
                  width: 24 * w,
                  height: 24 * h,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 534 * h,
                left: 140 * w,
                child: Text(
                  "Forgotten Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 16 * w,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xFF0A9EF3),
                  ),
                ),
              ),

              Positioned(
                top: 593 * h,
                left: 152 * w,
                child: GestureDetector(
                  onTap: () async {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all required fields'),
                        ),
                      );
                      return;
                    }

                    if (_loginController.isLoading) return;

                    final success = await _loginController.login(
                      usernameController.text,
                      passwordController.text,
                    );

                    if (success) {
                      if (!context.mounted) return;
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => const DashboardScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    } else {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _loginController.errorMessage ?? 'Login failed',
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    width: 125 * w,
                    height: 48 * h,
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E75F4), // background
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBuilder(
                          animation: _loginController,
                          builder: (context, child) {
                            if (_loginController.isLoading) {
                              return const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              );
                            }
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Sign in",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    height: 1.0,
                                    fontSize: 16 * w,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 9 * w), // gap: 9px
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 809 * h,
                left: 124 * w,
                child: Container(
                  width: 179 * w,
                  height: 23 * h,
                  alignment: Alignment.center,
                  // color: const Color(0xFFFFFFFF), // background: #FFFFFF
                  child: Text(
                    "Don’t have an Account?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15 * w,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 836 * h,
                left: 167 * w,
                child: Text(
                  "Sign up now!",
                  style: GoogleFonts.poppins(
                    fontSize: 16 * w,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: -1,
                    color: const Color(0xFF0A9EF3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
