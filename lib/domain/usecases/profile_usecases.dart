import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<UserProfile> call() async {
    return await repository.getProfile();
  }
}

class LogoutUseCase {
  final ProfileRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() async {
    await repository.logout();
  }
}
