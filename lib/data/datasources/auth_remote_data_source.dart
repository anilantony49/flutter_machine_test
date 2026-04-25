import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl = 'https://api.accounts.vikncodes.com/api/v1/users/login';

  @override
  Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "password": password,
        "is_mobile": true
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success'] == 6000) {
        return UserModel.fromJson(jsonResponse);
      } else {
        throw Exception(jsonResponse['error'] ?? 'Login failed');
      }
    } else {
      throw Exception('Server Error');
    }
  }
}
