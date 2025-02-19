class ProfileModel {
  final int id;
  final String username, fullName, bio;
  final String image;
  final int recipeCount, followingCount, followerCount;

  ProfileModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.bio,
    required this.image,
    required this.recipeCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
      bio: json['presentation'],
      image: json['profilePhoto'],
      recipeCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
    );
  }
}
