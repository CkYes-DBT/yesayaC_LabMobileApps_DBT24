class Post {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;
  final String likes;
  final String timeAgo;
  final bool isVerified;
  final List<String>? media; // optional multiple images

  Post({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.caption,
    required this.likes,
    required this.timeAgo,
    this.isVerified = false,
    this.media,
  });
}
