import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getProfile(String token, int userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<UserProfileModel> getProfile(String token, int userId) async {
    final url = 'https://www.viknbooks.com/api/v10/users/user-view/$userId/';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success'] == 6000) {
        return UserProfileModel.fromJson(jsonResponse);
      } else {
        throw Exception(jsonResponse['message'] ?? 'Failed to load profile');
      }
    } else {
      throw Exception('Server Error: ${response.statusCode}');
    }
  }
}
