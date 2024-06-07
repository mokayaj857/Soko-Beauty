import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/widgets/custom_empty_state_msg.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/home/widgets/user_profile_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                return UserProfileCard(user: userProvider.user!);
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child:
                    _buildPostGrid(context), // Pass context to _buildPostGrid
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPostGrid(BuildContext context) {
    // Add context parameter
    final userProvider =
        Provider.of<UserProvider>(context); // Access UserProvider

    return TabBarView(
      children: [
        PostsTab(postIds: userProvider.user!.posts),
        LikedPostsTab(likedPostIds: userProvider.user!.likedPosts),
        ShopsTab(shopIds: userProvider.user!.shops),
      ],
    );
  }
}

class PostsTab extends StatelessWidget {
  final List<String> postIds;

  const PostsTab({Key? key, required this.postIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postIds.isEmpty
        ? Center(
            child: EmptyStateMessage(
            message: 'You have no posts yet.',
            onPressed: () {},
            buttonText: "Create Post", icon: Icons.post_add,
            ),
          )
        : ListView.builder(
            itemCount: postIds.length,
            itemBuilder: (context, index) {
              // Display post based on postIds[index]
              return ListTile(
                title: Text('Post ${postIds[index]}'),
              );
            },
          );
  }
}

class LikedPostsTab extends StatelessWidget {
  final List<String> likedPostIds;

  const LikedPostsTab({Key? key, required this.likedPostIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return likedPostIds.isEmpty
        ? Center(
            child: EmptyStateMessage(
            message: 'You have no liked posts yet.',
            onPressed: () {},
            buttonText: "Explore Posts", icon: Icons.explore_outlined,
            ),
          )
        : ListView.builder(
            itemCount: likedPostIds.length,
            itemBuilder: (context, index) {
              // Display liked post based on likedPostIds[index]
              return ListTile(
                title: Text('Liked Post ${likedPostIds[index]}'),
              );
            },
          );
  }
}

class ShopsTab extends StatelessWidget {
  final List<String> shopIds;

  const ShopsTab({Key? key, required this.shopIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shopIds.isEmpty
        ? Center(
            child: EmptyStateMessage(
            message: 'You have no shops yet.',
            onPressed: () {},
            buttonText: "Create Shop", icon: Icons.storefront_outlined,
          ))
        : ListView.builder(
            itemCount: shopIds.length,
            itemBuilder: (context, index) {
              // Display shop based on shopIds[index]
              return ListTile(
                title: Text('Shop ${shopIds[index]}'),
              );
            },
          );
  }
}
