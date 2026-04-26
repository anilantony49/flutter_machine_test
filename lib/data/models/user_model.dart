import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.token,
    required super.username,
    required super.companyId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UserModel(
      id: data['user_id'] ?? 0,
      token: data['access'] ?? '',
      username: data['username'] ?? '',
      companyId: (data['CompanyID'] ?? data['company_id'] ?? '').toString(),
    );
  }
}
