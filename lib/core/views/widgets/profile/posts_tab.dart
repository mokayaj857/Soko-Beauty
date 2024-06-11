import 'package:flutter/material.dart';
import 'package:soko_beauty/core/views/widgets/custom_empty_state_msg.dart';
import 'package:soko_beauty/home/post.dart';

class PostsTab extends StatelessWidget {
  const PostsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EmptyStateMessage(
            message: 'You have no posts yet.',
            onPressed: () {
              showModalBottomSheet(
                elevation: 1,
                barrierColor: Colors.black.withOpacity(0.26),
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return BottomSheetContent();
                },
              );
            },
            buttonText: "Create Post",
            icon: Icons.post_add,
          ),
        ],
      ),
    );
  }
}
