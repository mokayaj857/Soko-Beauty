import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/views/screens/all_videos.dart';
import 'package:soko_beauty/feautures/video/views/screens/products_videos.dart';
import 'package:soko_beauty/feautures/video/views/screens/services_videos.dart';

class VideoPage extends StatefulWidget {
  VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withOpacity(0.3),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 0.0,
            ),
            labelColor: Colors.white.withOpacity(0.7),
            // labelStyle: TextStyle(
            //   fontWeight: FontWeight.w600,
            //   decorationStyle: TextDecorationStyle.solid,
            //   decoration: TextDecoration.underline,
            //   decorationThickness: 3.0,
            //   decorationColor: Theme.of(context).primaryColor.withOpacity(0.75),
            // ),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.white.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                text: 'Community',
                height: 25,
              ),
              Tab(
                text: 'Services',
                height: 25,
              ),
              Tab(
                text: 'Products',
                height: 25,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded,
                  color: Colors.white.withOpacity(0.9), size: 30.0),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Expanded(child: AllVideosTab()),
            Expanded(child: ServicesVideosTab()),
            Expanded(child: ProductsVideoTab()),
          ],
        ),
      ),
    );
  }
}
