import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/screens/profile.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel user; 

  const UserProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(user.username,
          style: TextStyle(
            fontSize: 16,
          )),
      backgroundColor:
          Theme.of(context).bottomAppBarTheme.color!.withOpacity(0.9),
      foregroundColor: sbbrickRed,
      pinned: true,
      expandedHeight: 300,
      leading: IconButton(
        onPressed: () {
          // Handle back button tap
        },
        icon: Icon(
          Icons.search_outlined,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //navigate to settings page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(),
              ),
            );
          },
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          padding: EdgeInsets.all(0),
          tabs: [
            Tab(
              text: 'Posts',
            ),
            Tab(
              text: 'Liked',
            ),
            Tab(
              text: 'Shops',
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: false,
        background: Container(
          margin: EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        children: [
                          // USER PROFILE BORDERED IMAGE AND NAME
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: sbbrickRed,
                                width: 4,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  user.profilePhotoUrl ?? ''), // Use user data
                            ),
                          ),
                          Text(
                            '${user.fname ?? ''} ${user.lname ?? ''}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user.bio ?? '', // Use user data
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    user.postsCount.toString(), // Use user data
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Posts',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: sbbrickRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    user.followersCount
                                        .toString(), // Use user data
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: sbbrickRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    user.followingCount
                                        .toString(), // Use user data
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: sbbrickRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
