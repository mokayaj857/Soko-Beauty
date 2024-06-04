import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/services/theme_provider.dart';
import 'package:soko_beauty/core/utils/camera_utils.dart';
import 'package:soko_beauty/core/utils/permission_utils.dart';
import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/home/views/screens/main/camera_page.dart';
import 'package:soko_beauty/home/views/screens/main/chats.dart';
import 'package:soko_beauty/home/views/screens/main/market.dart';
import 'package:soko_beauty/home/views/screens/main/my_account.dart';
import 'package:soko_beauty/home/views/screens/main/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _previousIndex = 0;

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
          ? Colors.black
          : themeProvider.themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: _currentIndex == 0
          ? Colors.black
          : themeProvider.themeData.scaffoldBackgroundColor,
    ));
  }

  Widget _buildCameraPage() {
    return BlocProvider(
      create: (context) => CameraBloc(
        cameraUtils: CameraUtils(),
        permissionUtils: PermissionUtils(),
      )..add(const CameraInitialize(recordingLimit: 15)),
      child: CameraPage(
        onExit: () {
          setState(() {
            _currentIndex = _previousIndex;
          });
          _setSystemUIOverlayStyle();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isOnCamera = _currentIndex == 2;

    final List<Widget> _screens = [
      VideoPage(),
      MarketPage(),
      _buildCameraPage(),
      ChatsPage(),
      ProfilePage(),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setSystemUIOverlayStyle();
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: isOnCamera || _currentIndex == 0,
      body: _screens[_currentIndex],
      bottomNavigationBar: isOnCamera
          ? null
          : BottomAppBar(
              color: _currentIndex == 0
                  ? Colors.black.withOpacity(0.9)
                  : Theme.of(context).scaffoldBackgroundColor,
              shape: CircularNotchedRectangle(),
              notchMargin: 0,
              elevation: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(0, Icons.home_filled, 'Home'),
                  buildNavItem(1, Icons.shop, 'Shop'),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        _previousIndex = _currentIndex;
                        _currentIndex = 2;
                      });
                      _setSystemUIOverlayStyle();
                    },
                    mini: true,
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 30,
                      color: _currentIndex == 0
                          ? Colors.white
                          : Theme.of(context).hintColor,
                    ),
                  ),
                  buildNavItemWithBadge(
                      3, Icons.mark_chat_unread_rounded, 'Inbox', 3),
                  buildNavItem(4, Icons.person, 'Profile'),
                ],
              ),
            ),
      floatingActionButton: isOnCamera
          ? null
          : SizedBox(
              width: 10,
            ),
      floatingActionButtonLocation:
          isOnCamera ? null : FloatingActionButtonLocation.centerDocked,
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
                ? sbbrickRed
                : _currentIndex == 0
                    ? Colors.white
                    : Theme.of(context).hintColor,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: _currentIndex == index
                  ? sbbrickRed
                  : _currentIndex == 0
                      ? Colors.white
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
                color: sbwarmRed,
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
