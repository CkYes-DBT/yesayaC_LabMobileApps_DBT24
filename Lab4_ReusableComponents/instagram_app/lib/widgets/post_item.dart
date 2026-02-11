import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({
    super.key,
    required this.post,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final media = (post.media != null && post.media!.isNotEmpty)
        ? post.media!
        : (post.postImage.isNotEmpty ? [post.postImage] : <String>[]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Post
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFBAA47),
                      Color(0xFFD91A46),
                      Color(0xFFA60F93),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF000000),
                  ),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[800],
                    backgroundImage: post.userImage.isNotEmpty
                        ? AssetImage(post.userImage)
                        : null,
                    child: post.userImage.isEmpty
                        ? Icon(Icons.person, size: 20, color: Colors.grey[600])
                        : null,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    post.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (post.isVerified) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: Color(0xFF0095F6),
                      size: 14,
                    ),
                  ],
                ],
              ),
              const Spacer(),
              Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),

        // Post Image
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.grey[900],
          child: media.isNotEmpty
              ? Stack(
                  children: [
                    PageView.builder(
                      itemCount: media.length,
                      onPageChanged: (i) => setState(() => _pageIndex = i),
                      itemBuilder: (_, index) {
                        return Image.asset(
                          media[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                    if (media.length > 1)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${_pageIndex + 1}/${media.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : Center(
                  child: Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey[700],
                  ),
                ),
        ),

        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.white, size: 28),
              const SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
              const SizedBox(width: 16),
              Icon(Icons.send_outlined, color: Colors.white, size: 26),
              const Spacer(),
              Icon(Icons.bookmark_border, color: Colors.white, size: 26),
            ],
          ),
        ),

        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post.likes,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' ${post.caption}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            post.timeAgo,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
