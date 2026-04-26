import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required super.name,
    required super.email,
    super.profilePic,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return UserProfileModel(
      name: data['first_name'] ?? data['username'] ?? 'No Name',
      email: data['email'] ?? 'No Email',
      profilePic: data['profile_pic'],
    );
  }
}
