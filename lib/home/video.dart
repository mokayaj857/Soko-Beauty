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
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.9),
                width: 2.0,
              ),
            )),
            labelColor: Colors.white.withOpacity(0.9),
            indicatorPadding: EdgeInsets.only(bottom: 8.0, right: 5, left: 5),
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.white.withOpacity(0.7),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
            splashFactory: NoSplash.splashFactory,
            tabs: VideoTab.values.map((tab) {
              return Tab(
                text: tab.name,
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
