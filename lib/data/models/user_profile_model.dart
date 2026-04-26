import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required super.name,
    required super.email,
    super.profilePic,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    
    final userData = data is Map && data.containsKey('data') ? data['data'] : data;
    
    return UserProfileModel(
      name: userData['first_name'] ?? userData['username'] ?? userData['CustomerName'] ?? userData['Fullname'] ?? 'No Name',
      email: userData['email'] ?? 'No Email',
      profilePic: userData['profile_pic'],
    );
  }
}
