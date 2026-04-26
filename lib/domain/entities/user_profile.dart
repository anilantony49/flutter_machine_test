class UserProfile {
  final String name;
  final String email;
  final String? profilePic;

  UserProfile({
    required this.name,
    required this.email,
    this.profilePic,
  });
}
