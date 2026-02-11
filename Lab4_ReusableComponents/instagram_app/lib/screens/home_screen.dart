import 'package:flutter/material.dart';
import '../models/story_model.dart';
import '../models/post_model.dart';
import '../widgets/story_item.dart';
import '../widgets/post_item.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'chat_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dummy data untuk stories
  List<Story> _getStories() {
    return [
      Story(
        username: 'Your story',
        imageUrl: 'assets/images/content.png',
        isYourStory: true,
      ),
      Story(
        username: 'bc.8a4112i1a',
        imageUrl: 'assets/images/content.png',
      ),
      Story(
        username: 'stockwise.id',
        imageUrl: 'assets/images/content.png',
      ),
      Story(
        username: 'audrreyy',
        imageUrl: 'assets/images/content.png',
      ),
      Story(
        username: 'tech_daily',
        imageUrl: 'assets/images/content.png',
      ),
      Story(
        username: 'food_lover',
        imageUrl: 'assets/images/content.png',
      ),
    ];
  }

  // Dummy data untuk posts
  List<Post> _getPosts() {
    return [
      Post(
        username: 'stockwise.id',
        userImage: 'assets/images/content.png',
        postImage: 'assets/images/content.png',
        media: [
          'assets/images/content.png',
          'assets/images/content.png',
        ],
        caption: 'Penggerak IHSG SAHAMPAK PP KOMPAK NAIK 📈',
        likes: '1,234 likes',
        timeAgo: '2 hours ago',
        isVerified: true,
      ),
      Post(
        username: 'tech_daily',
        userImage: 'assets/images/content.png',
        postImage: 'assets/images/content.png',
        caption: 'Amazing view from the office today! ☀️ #worklife #office',
        likes: '856 likes',
        timeAgo: '5 hours ago',
        isVerified: false,
      ),
      Post(
        username: 'food_lover',
        userImage: 'assets/images/content.png',
        postImage: 'assets/images/content.png',
        caption: 'Trying out this new restaurant in town 🍕🍔 Highly recommended!',
        likes: '2,431 likes',
        timeAgo: '8 hours ago',
        isVerified: true,
      ),
      Post(
        username: 'travel_world',
        userImage: 'assets/images/content.png',
        postImage: 'assets/images/content.png',
        caption: 'Sunset at the beach 🌅 Perfect end to a perfect day #travel #beach',
        likes: '3,892 likes',
        timeAgo: '1 day ago',
        isVerified: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final stories = _getStories();
    final posts = _getPosts();

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppTopBar(
        title: 'Instagram',
        onAddTap: () {},
        onHeartTap: () {},
      ),
      body: CustomScrollView(
        slivers: [
          // Stories Section
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[900]!,
                    width: 0.5,
                  ),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return StoryItem(story: stories[index]);
                },
              ),
            ),
          ),

          // Posts Section
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostItem(post: posts[index]);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatListScreen()),
            );
          }
        },
      ),
    );
  }
}
