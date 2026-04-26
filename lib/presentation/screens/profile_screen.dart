import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikn_codes_flutter_task/presentation/screens/login_screen.dart';
import 'package:vikn_codes_flutter_task/presentation/widgets/bottom_nav_widget.dart';
import '../../data/datasources/profile_remote_data_source.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/usecases/profile_usecases.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController _controller;

  @override
  void initState() {
    super.initState();
    final remote = ProfileRemoteDataSourceImpl();
    final repo = ProfileRepositoryImpl(remoteDataSource: remote);
    final getProfileUseCase = GetProfileUseCase(repo);
    final logoutUseCase = LogoutUseCase(repo);
    _controller = ProfileController(
      getProfileUseCase: getProfileUseCase,
      logoutUseCase: logoutUseCase,
    );
    _controller.fetchProfile();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 430;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            if (_controller.isLoading && _controller.profile == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final profile = _controller.profile;

            return Column(
              children: [
                ///   TOP CARD
                Padding(
                  padding: EdgeInsets.only(
                    left: 18 * w,
                    top: 63 * w,
                    right: 18 * w,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20 * w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F0F0F),
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Column(
                      children: [
                        /// PROFILE ROW
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// AVATAR
                                Container(
                                  width: 100 * w,
                                  height: 100 * w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                  child: Center(
                                    child:
                                        profile?.profilePic != null
                                            ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              child: Image.network(
                                                profile!.profilePic!,
                                                width: 100 * w,
                                                height: 100 * w,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) => Image.asset(
                                                      "assets/images/pngaaa 1.png",
                                                      width: 55 * w,
                                                    ),
                                              ),
                                            )
                                            : Image.asset(
                                              "assets/images/pngaaa 1.png",
                                              width: 55 * w,
                                            ),
                                  ),
                                ),

                                SizedBox(width: 14 * w),

                                /// NAME
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profile?.name != "No Name" &&
                                              profile?.name != null
                                          ? profile!.name
                                          : "David Arnold",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20 * w,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      profile?.email != "No Email" &&
                                              profile?.email != null
                                          ? profile!.email
                                          : "david012@cabzing",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14 * w,
                                        color: const Color(0xFFB5CDFE),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.06 * 14 * w,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Image.asset("assets/images/edit.png", width: 24),

                            SizedBox(width: 6 * w),
                          ],
                        ),

                        SizedBox(height: 20 * w),

                        ///   STATS ROW
                        Row(
                          children: [
                            Expanded(
                              child: _statCard(
                                icon: "assets/images/stars.png",
                                title: "4.3★",
                                subtitle1: "2,211",
                                subtitle2: "rides",
                                bg: const Color(0xFFB5CDFE),
                                w: w,
                                showTick: false,
                              ),
                            ),
                            SizedBox(width: 10 * w),
                            Expanded(
                              child: _statCard(
                                icon: "assets/images/shield-tick.png",
                                title: "KYC",
                                subtitle1: "Verified",
                                subtitle2: "",
                                bg: const Color(0xFFA9C9C5),
                                w: w,
                                showTick: true,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        ///   LOGOUT BUTTON
                        InkWell(
                          onTap: () async {
                            await _controller.logout();
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Logout successfully',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF0E75F4),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            }
                          },
                          child: Container(
                            height: 67 * w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF040404),
                              borderRadius: BorderRadius.circular(174 * w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/logout.png",
                                  width: 24 * w,
                                ),
                                SizedBox(width: 10 * w),
                                Text(
                                  "Logout",
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFFEA6262),
                                    fontSize: 16 * w,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                ///  MENU LIST
                _menuItem("assets/images/badge-help.png", "Help", w),
                _menuItem("assets/images/search-status.png", "FAQ", w),
                _menuItem("assets/images/Add-Person.png", "Invite Friends", w),
                _menuItem(
                  "assets/images/shield-search.png",
                  "Terms of Service",
                  w,
                ),
                _menuItem(
                  "assets/images/security-safe.png",
                  "Privacy Policy",
                  w,
                ),

                const Spacer(),
              ],
            );
          },
        ),
      ),

      ///   BOTTOM NAV
      bottomNavigationBar: bottomNav(context, w, 3),
    );
  }

  ///   STAT CARD
  static Widget _statCard({
    required String icon,
    required String title,
    required String subtitle1,
    required String subtitle2,
    required Color bg,
    required double w,
    bool showTick = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12 * w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(33 * w),
      ),
      child: Row(
        children: [
          Container(
            width: 38 * w,
            height: 78 * w,
            padding: EdgeInsets.all(10 * w),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(100 * w),
            ),
            child: Image.asset(icon, width: 18 * w),
          ),

          SizedBox(width: 10 * w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14 * w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (showTick) ...[
                    SizedBox(width: 6 * w),
                    SizedBox(
                      width: 10 * w,
                      height: 10 * w,
                      child: Image.asset("assets/images/Vector.png"),
                    ),
                  ],
                ],
              ),
              if (subtitle1.isNotEmpty)
                Text(
                  subtitle1,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF565656),
                    fontSize: 12 * w,
                  ),
                ),
              if (subtitle2.isNotEmpty)
                Text(
                  subtitle2,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFB5CDFE),
                    fontSize: 12 * w,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  ///   MENU ITEM
  static Widget _menuItem(String icon, String title, double w) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50 * w, vertical: 24 * w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon, width: 24 * w),
              SizedBox(width: 12 * w),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15 * w,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 14 * w, color: Colors.white),
        ],
      ),
    );
  }
}
