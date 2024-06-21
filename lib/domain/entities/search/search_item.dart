class SearchItem {
  final String login;
  final String? imageUrl;
  final String followersUrl;
  final String followingUrl;
  int? followersCount;
  int? followingCount;

  SearchItem({
    required this.login,
    this.imageUrl,
    required this.followersUrl,
    required this.followingUrl,
    this.followersCount,
    this.followingCount,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      imageUrl: json['avatar_url'],
      login: json['login'] ?? "",
      followersUrl: json['followers_url'] ?? "",
      followingUrl: json['following_url'] ?? "",
    );
  }
}
