import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password are required');
    }
    return await repository.login(username, password);
  }
}
