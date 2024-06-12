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
          toolbarHeight: 70.0,
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: MediaQuery.of(context).size.width - 30,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 20.0,
            ),
            child: TabBar(
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
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              isScrollable: true,
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              tabs: VideoTab.values.map((tab) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 8.0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (tab != VideoTab.all) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Icon(
                            getIcon(tab),
                            size: 21,
                          ),
                        ),
                      ],
                      SizedBox(width: 5.0),
                      Text(
                        tab.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
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

  // method to get icon based on tab value
  IconData getIcon(VideoTab tab) {
    switch (tab) {
      case VideoTab.services:
        return Icons.face;
      case VideoTab.all:
        return Icons.all_inbox;
      case VideoTab.products:
        return CupertinoIcons.bag;
    }
  }
}
