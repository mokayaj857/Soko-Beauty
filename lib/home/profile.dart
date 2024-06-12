import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/views/widgets/profile/posts_tab.dart';
import 'package:soko_beauty/core/views/widgets/profile/shops_tab.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/core/views/widgets/user_profile_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              Consumer<UserProvider>(
                builder: (context, userProvider, _) {
                  return UserProfileCard(user: userProvider.user!);
                },
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(icon: Icon(CupertinoIcons.photo_fill)),
                      Tab(icon: Icon(CupertinoIcons.heart_fill)),
                      Tab(icon: Icon(CupertinoIcons.bag_fill)),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Consumer<UserProvider>(
            builder: (context, userProvider, _) {
              return TabBarView(
                children: [
                  PostsTab(),
                  LikedPostsTab(),
                  ShopsTab(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class LikedPostsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Liked Posts Tab'));
  }
}


