import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/tabs.dart';
import 'package:soko_beauty/feautures/video/views/screens/watch_videos.dart';

class VideoPage extends StatefulWidget {
  VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: VideoTab.values.length, // Number of tabs
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 300,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black.withOpacity(0.3),
              // border: BorderSide.only( ,
            ),
            labelColor: Colors.white.withOpacity(0.7),
            indicatorPadding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.white.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
            splashFactory: NoSplash.splashFactory,
            tabs: VideoTab.values.map((tab) {
              return Tab(
                text: tab.name,
                height: 20,
              );
            }).toList(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.search,
                  color: Colors.white.withOpacity(0.9), size: 30.0),
            ),
          ],
        ),
        body: TabBarView(
            children: VideoTab.values.map((tab) {
          return WatchVideos(
            currentTab: tab,
          );
        }).toList()),
      ),
    );
  }
}
