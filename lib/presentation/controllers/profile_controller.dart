import 'package:flutter/material.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/profile_usecases.dart';

class ProfileController extends ChangeNotifier {
  final GetProfileUseCase getProfileUseCase;
  final LogoutUseCase logoutUseCase;

  ProfileController({
    required this.getProfileUseCase,
    required this.logoutUseCase,
  });

  UserProfile? _profile;
  UserProfile? get profile => _profile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _profile = await getProfileUseCase();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await logoutUseCase();
  }
}
