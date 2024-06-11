
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/views/widgets/custom_empty_state_msg.dart';
import 'package:soko_beauty/home/post.dart';



class LikedPostsTab extends StatelessWidget {
  final List<String> likedPostIds;

  const LikedPostsTab({Key? key, required this.likedPostIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return likedPostIds.isEmpty
        ? Center(
            child: EmptyStateMessage(
              message: 'You have no liked posts yet.',
              onPressed: () {
                showModalBottomSheet(
                  elevation: 1,
                  barrierColor: AppColors.black.withOpacity(0.26),
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return BottomSheetContent();
                  },
                );
              },
              buttonText: "Explore Posts",
              icon: Icons.explore_outlined,
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
            buttonText: "Create Shop",
            icon: Icons.storefront_outlined,
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
