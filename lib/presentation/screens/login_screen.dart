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
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    final remote = AuthRemoteDataSourceImpl();
    final repo = AuthRepositoryImpl(remoteDataSource: remote);
    final usecase = LoginUseCase(repo);
    _loginController = LoginController(loginUseCase: usecase);
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
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔹 BACKGROUND  COLORS
          _buildBackground(w),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24 * w,
                vertical: 88 * w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 🔹 TOP RIGHT LANGUAGE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/language-hiragana.png",
                        width: 24 * w,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "English",
                        style: GoogleFonts.poppins(
                          fontSize: 14 * w,
                          fontWeight: FontWeight.w400,
                          height: 1.0, // line-height: 100%
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// 🔹 TITLE
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 21 * w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 6 * w),

                  Text(
                    "Login to your vikn account",
                    style: GoogleFonts.poppins(
                      fontSize: 15 * w,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: 0,

                      color: const Color(0xFF838383),
                    ),
                  ),

                  SizedBox(height: 30 * w),

                  /// 🔹 INPUT TEXT FIELD
                  _buildInputCard(w),

                  SizedBox(height: 30 * w),

                  /// 🔹 FORGOT PASSWORD
                  Text(
                    "Forgotten Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 16 * w,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0,
                      color: const Color(0xFF0A9EF3),
                    ),
                  ),

                  SizedBox(height: 30 * w),

                  /// 🔹 LOGIN BUTTON
                  _buildLoginButton(w),

                  const Spacer(),

                  /// 🔹 SIGNUP
                  Text(
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
                  SizedBox(height: 10 * w),
                  Text(
                    "Sign up now!",
                    style: GoogleFonts.poppins(
                      fontSize: 16 * w,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: -1,
                      color: const Color(0xFF0A9EF3),
                    ),
                  ),

                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 BACKGROUND
  Widget _buildBackground(double w) {
    return Positioned.fill(
      child: Stack(
        children: [
          _blurCircle(Offset(-20 * w, 250), Color(0xFFEEF223)),
          _blurCircle(Offset(60 * w, 730), Color(0xFFFC6BFF)),
          _blurCircle(Offset(300 * w, 400), Color(0xFF00D0FE)),
        ],
      ),
    );
  }

  Widget _blurCircle(Offset pos, Color color) {
    return Positioned(
      left: pos.dx,
      top: pos.dy,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  /// 🔹 INPUT CARD (IMPORTANT FIX)
  Widget _buildInputCard(double w) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF08131E),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFF1C3347)),
      ),
      child: Column(
        children: [
          _inputField(
            controller: usernameController,
            hint: "Username",
            icon: "assets/images/user-2.png",
            label: 'Username',
          ),
          Divider(color: Color(0xFF1C3347), height: 1),
          _inputField(
            controller: passwordController,
            hint: "Password",
            icon: "assets/images/key-round.png",
            isPassword: true,
            label: 'Password',
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required String icon,
    required String label,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.asset(icon, width: 24),
          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,

              obscureText: isPassword ? _isPasswordHidden : false,

              style: GoogleFonts.poppins(color: Colors.white),

              decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color: const Color(0xFF7D7D7D)),
                border: InputBorder.none,

                suffixIcon:
                    isPassword
                        ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/eye.png", // 👁 your asset
                              width: 20,
                              height: 20,
                            ),
                          ),
                        )
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 LOGIN BUTTON
  Widget _buildLoginButton(double w) {
    return GestureDetector(
      onTap: _handleLogin,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0E75F4),
          borderRadius: BorderRadius.circular(120),
        ),
        child: AnimatedBuilder(
          animation: _loginController,
          builder: (_, __) {
            if (_loginController.isLoading) {
              return const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
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
                const SizedBox(width: 9),
                const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            );
          },
        ),
      ),
    );
  }

  /// 🔹 LOGIN LOGIC
  Future<void> _handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final success = await _loginController.login(
      usernameController.text,
      passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_loginController.errorMessage ?? 'Failed')),
      );
    }
  }
}
