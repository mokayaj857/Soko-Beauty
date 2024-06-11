import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
import 'package:soko_beauty/feautures/video/data/models/tabs.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:soko_beauty/feautures/video/views/widgets/build_video.dart';

class WatchVideos extends StatefulWidget {
  final VideoTab currentTab;

  const WatchVideos({Key? key, required this.currentTab}) : super(key: key);

  @override
  _WatchVideosState createState() => _WatchVideosState();
}

class _WatchVideosState extends State<WatchVideos> {
  late VideoProvider videoProvider;
  List<Video> videos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    videoProvider = Provider.of<VideoProvider>(context, listen: false);
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    setState(() {
      isLoading = true;
    });

    if (widget.currentTab == VideoTab.all) {
      videos = await videoProvider.getAllVideos();
    } else {
      videos = await videoProvider.getVideosByType(
        widget.currentTab == VideoTab.products
            ? VideoType.Product
            : VideoType.Service,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> refresh() async {
    await fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: isLoading ? _buildLoadingWidget() : _buildPageView(),
    );
  }

  Widget _buildLoadingWidget() {
    return LoadingWidget(
      color: AppColors.primary,
    );
  }

  Widget _buildPageView() {
    return videos.isEmpty
        ? _buildNoVideosFoundWidget()
        : PageView(
            scrollDirection: Axis.vertical,
            physics: PageScrollPhysics(),
            children: videos.map((video) {
              return VideoWidgetBuilder(
                video: video,
              );
            }).toList(),
          );
  }

  Widget _buildNoVideosFoundWidget() {
    return Center(
      child: Text(
        //show no videos found base on the current tab name
        widget.currentTab == VideoTab.all
            ? 'No videos found'
            : 'No ${widget.currentTab.name} videos found',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
