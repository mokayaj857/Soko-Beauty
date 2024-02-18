import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/home/screens/chats.dart';
import 'package:soko_beauty/pages/home/screens/market.dart';
import 'package:soko_beauty/pages/home/screens/post.dart';
import 'package:soko_beauty/pages/home/screens/profile.dart';
import 'package:soko_beauty/pages/home/screens/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    VideoPage(),
    ChatsPage(),
    MarketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(0, Icons.video_library, 'Home'),
                buildNavItemWithBadge(1, Icons.shop, 'Inbox', 3),
                SizedBox(width: 10,),
                buildNavItem(2, Icons.shop, 'Market'),
                buildNavItem(3, Icons.person, 'Profile'),
              ],
            ),
          ),
          floatingActionButton: Positioned(
            bottom: 0.0,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).bottomAppBarTheme.color,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(),
                  ),
                );
              },
              mini: true,
              child: Icon(
                Icons.add_a_photo_rounded,
                size: 20,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? sbbrickRed : null,
          ),
          Text(label, style: TextStyle(fontSize: 10, color: _currentIndex == index ? sbbrickRed : null)),
        ],
      ),
    );
  }

  Widget buildNavItemWithBadge(
      int index, IconData icon, String label, int badgeCount) {
    return Stack(
      children: [
        buildNavItem(index, icon, label),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: sbwarmRed,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
