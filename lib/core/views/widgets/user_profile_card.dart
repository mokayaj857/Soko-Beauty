import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/theme/light.dart';
import 'package:soko_beauty/core/views/services/theme_provider.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/screens/profile.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel user;

  const UserProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: true,
      forceElevated: true,
      expandedHeight: 350, // Increased height to accommodate the design
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(
          user.username,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leadingWidth: 200,
      actions: _buildActions(context),
      flexibleSpace: _buildFlexibleSpace(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Provider.of<ThemeProvider>(context).themeData == lightMode
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false)
              .toggleTheme(context);
        },
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountPage()),
          );
        },
        icon: const Icon(CupertinoIcons.settings),
      ),
    ];
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        margin: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor.withOpacity(0.5),
                radius: 45,
                backgroundImage: user.profilePhotoUrl != null
                    ? NetworkImage(user.profilePhotoUrl!)
                    : const AssetImage("assets/user_avatar.png")
                        as ImageProvider,
              ),
              const SizedBox(height: 5),
              Text(
                '${user.fname ?? ''} ${user.lname ?? ''}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${user.bio ?? ''}',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),
              _buildUserStats(context),
              const SizedBox(height: 30),
              _buildButtonsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatColumn(context, user.stats.posts, 'Posts'),
        _buildStatColumn(context, user.stats.followers, 'Followers'),
        _buildStatColumn(context, user.stats.following, 'Following'),
      ],
    );
  }

  Widget _buildStatColumn(BuildContext context, int count, String label) {
    return Row(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).highlightColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.edit, size: 22),
                const SizedBox(width: 10),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).highlightColor.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            // Handle add friends button press
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).highlightColor.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.cart_fill,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'View Cart',
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).highlightColor.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
