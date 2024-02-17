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
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.video_library),
                      Text('Home'),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shop),
                          Text('Inbox'),
                        ],
                      ),
                    ),
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
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shop),
                      Text('Market'),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person),
                      Text('Profile'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Positioned(
            bottom: 0.0,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context)
                  .bottomAppBarTheme
                  .color, //Colors.red.shade50,
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
                Icons.camera,
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
}
