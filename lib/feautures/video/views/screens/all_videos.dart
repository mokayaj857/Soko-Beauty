import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';

class AllVideosTab extends StatefulWidget {
  @override
  _AllVideosTabState createState() => _AllVideosTabState();
}

class _AllVideosTabState extends State<AllVideosTab> {
  late VideoProvider videoProvider;
  late UserProvider userProvider;
  List<Video> allVideos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    videoProvider = Provider.of<VideoProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    setState(() {
      isLoading = true;
    });
    allVideos = await videoProvider.getAllVideos();
    setState(() {
      isLoading = false;
    });
  }

  Future<UserModel?> getOwner(String ownerId) async {
    return await userProvider.getUserFromDB(userId: ownerId);
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
      body: isLoading
          ? loadingWidget
          : RefreshIndicator(
              onRefresh: refresh,
              child: allVideos.isEmpty
                  ? Center(
                      child: Text(
                        'No videos available.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : PageView(
                      scrollDirection: Axis.vertical,
                      physics: PageScrollPhysics(),
                      children: allVideos.map((video) {
                        return FutureBuilder<UserModel?>(
                          future: getOwner(video.ownerId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  'Error loading video owner',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              UserModel? videoOwner = snapshot.data;
                              if (videoOwner == null) {
                                return Center(
                                  child: Text(
                                    'Owner not found',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                              return VideoPlayerScreen(
                                videoInfo: video,
                                key: Key('video_${video.id}'),
                                videoActions: VideoActionButtons(
                                  onFavoritePressed: () {
                                    // videoProvider.favoriteVideo(
                                    //   videoId: video.id,
                                    //   favorite: true,
                                    // );
                                  },
                                  onCommentPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return CommentSection();
                                      },
                                    );
                                  },
                                  shoppingCartPressed: () {},
                                  onSharePressed: () {},
                                  bookingIconPressed: () {},
                                  currentTab: '',
                                ),
                                onFollow: () {
                                  userProvider.followUser(
                                    followedUser: videoOwner.id,
                                    follow: true,
                                  );
                                },
                                soundName:
                                    '${videoOwner.username} - original sound',
                                ownerUsername: videoOwner.username,
                              );
                            } else {
                              return Center(
                                child: loadingWidget
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
            ),
    );
  }

  // build loading widget
  Widget get loadingWidget => Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent, // Set transparent background
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          backgroundColor: Colors.transparent,
                        ),
                        width: 100,
                        height: 3),
                  ],
                ),
              ),
            );
}
