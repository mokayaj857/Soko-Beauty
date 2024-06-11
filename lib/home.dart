import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/config/styles/global_styles.dart';
import 'package:soko_beauty/core/views/services/theme_provider.dart';
import 'package:soko_beauty/home/chat.dart';
import 'package:soko_beauty/home/post.dart';
import 'package:soko_beauty/home/shop.dart';
import 'package:soko_beauty/home/profile.dart';
import 'package:soko_beauty/home/video.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setSystemUIOverlayStyle();
    });
  }

  void _setSystemUIOverlayStyle() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: _currentIndex == 0
          ? Brightness.light
          : themeProvider.themeData.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      systemNavigationBarColor: _currentIndex == 0
          ? AppColors.black
          : themeProvider.themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: _currentIndex == 0
          ? AppColors.black
          : themeProvider.themeData.scaffoldBackgroundColor,
      systemStatusBarContrastEnforced: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      VideoPage(),
      MarketPage(),
      ChatsPage(),
      ProfilePage(),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setSystemUIOverlayStyle();
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: _currentIndex == 0,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        height: AppSizes.bottomAppBarHeight,
        color: _currentIndex == 0
            ? AppColors.black.withOpacity(0.9)
            : Theme.of(context).scaffoldBackgroundColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(0, CupertinoIcons.house_alt_fill, 'Home'),
            buildNavItem(1, CupertinoIcons.bag_fill, 'Shop'),
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              focusElevation: 0.1,
              onPressed: () => _showBottomSheet(context),
              mini: true,
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 35,
                color: _currentIndex == 0
                    ? AppColors.white
                    : Theme.of(context).hintColor,
              ),
            ),
            buildNavItemWithBadge(
                2, CupertinoIcons.chat_bubble_2_fill, 'Inbox', 3),
            buildNavItem(3, CupertinoIcons.person_fill, 'Profile'),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
        _setSystemUIOverlayStyle();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _currentIndex == index
                ? Theme.of(context).primaryColor
                : _currentIndex == 0
                    ? AppColors.white
                    : Theme.of(context).hintColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: _currentIndex == index
                  ? Theme.of(context).primaryColor
                  : _currentIndex == 0
                      ? AppColors.white
                      : Theme.of(context).hintColor,
            ),
          ),
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
            right: 5,
            top: 3,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: BoxConstraints(
                minWidth: 13,
                minHeight: 13,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 7,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 1,
      barrierColor: AppColors.black.withOpacity(0.26),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BottomSheetContent();
      },
    );
  }
}
