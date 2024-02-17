import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/video/tabs/all_videos.dart';
import 'package:soko_beauty/widgets/video/tabs/products_videos.dart';
import 'package:soko_beauty/widgets/video/tabs/services_videos.dart';

class VideoTabBar extends StatefulWidget {
  const VideoTabBar({Key? key}) : super(key: key);

  @override
  _VideoTabBarState createState() => _VideoTabBarState();
}

class _VideoTabBarState extends State<VideoTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(child: ServicesVideosTab()),
                Expanded(child: AllVideosTab()),
                Expanded(child: ProductsVideoTab()),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Positioned(
              top:  0,
              right: 40,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_checkout_sharp),
                ),
              ),
            ),
             Positioned(
              top: 0,
              left: 40,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down_outlined),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    dividerHeight: 0,
                    tabs: [
                      Tab(
                        text: 'Sevices',
                      ),
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Products',
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
