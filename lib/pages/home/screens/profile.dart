import 'dart:math';
import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/user/user_profile_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          UserProfileCard(),
          _buildPostGrid(),
        ],
      ),
    );
  }

  
  Widget _buildPostGrid() {
    return SliverGrid(

      delegate: SliverChildBuilderDelegate(
        
        (BuildContext context, int index) {
          return _buildPostCard(index);
        },
        childCount: 20, // Number of posts to display
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 1.0,
      ),
    );
  }

  Widget _buildPostCard(int index) {
    final int imageId = Random().nextInt(1000); // Random image ID from Picsum

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/id/$imageId/300/200'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Text("Post $index"),
      ),
    );
  }
}

