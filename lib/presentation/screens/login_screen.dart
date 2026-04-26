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
  final _formKey = GlobalKey<FormState>();
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
          ///   BACKGROUND  COLORS
          _buildBackground(w),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24 * w,
                          vertical: 40 * w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///   TOP RIGHT LANGUAGE
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
                                    height: 1.0,
                                    letterSpacing: 0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            ///  TITLE
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
                                height: 1.0,
                                letterSpacing: 0,
                                color: const Color(0xFF838383),
                              ),
                            ),

                            SizedBox(height: 30 * w),

                            ///   INPUT TEXT FIELD
                            _buildInputCard(w),

                            SizedBox(height: 30 * w),

                            ///   FORGOT PASSWORD
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

                            ///   LOGIN BUTTON
                            _buildLoginButton(w),

                            const Spacer(),

                            ///   SIGNUP
                            Text(
                              "Don’t have an Account?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 15 * w,
                                fontWeight: FontWeight.w400,
                                height: 1.0,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///   BACKGROUND
  Widget _buildBackground(double w) {
    return Positioned.fill(
      child: Stack(
        children: [
          _blurCircle(Offset(-30 * w, 250), Color(0xFFEEF223)),
          _blurCircle(Offset(10 * w, 750), Color(0xFFFC6BFF)),
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
        imageFilter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  ///   INPUT CARD (IMPORTANT FIX)
  Widget _buildInputCard(double w) {
    return Form(
      key: _formKey,
      child: Container(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                return null;
              },
            ),
            Divider(color: Color(0xFF1C3347), height: 1),
            _inputField(
              controller: passwordController,
              hint: "Password",
              icon: "assets/images/key-round.png",
              isPassword: true,
              label: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required String icon,
    required String label,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Image.asset(icon, width: 24),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: isPassword ? _isPasswordHidden : false,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                labelStyle: GoogleFonts.poppins(color: const Color(0xFF7D7D7D)),
                hintStyle: GoogleFonts.poppins(color: const Color(0xFF7D7D7D)),
                border: InputBorder.none,
                errorStyle: GoogleFonts.poppins(
                  color: Colors.redAccent,
                  fontSize: 12,
                ),
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

  ///  LOGIN BUTTON
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

  ///   LOGIN LOGIC
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final success = await _loginController.login(
      usernameController.text.trim(),
      passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login successfully',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0E75F4),
        ),
      );
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
